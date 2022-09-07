
-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT DISTINCT `degrees`.`name`, `students`.* FROM `degrees` JOIN `students` ON `degrees`.`id` = `students`.`degree_id` WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT `degrees`.* FROM `degrees` JOIN `departments` ON `departments`.`id` = `degrees`.`department_id` WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `courses`.`name`, `teachers`.`name`, `teachers`.`surname`, `teachers`.`id` FROM `courses` JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id` JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id` WHERE `teachers`.`name` = 'Fulvio' AND `teachers`.`surname` = 'Amato';

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT DISTINCT `students`.`surname`, `students`.`name`, `degrees`.`name`, `departments`.`name` FROM `degrees` JOIN `departments` ON `departments`.`id` = `degrees`.`department_id` JOIN `students` ON `degrees`.`id` = `students`.`degree_id` ORDER BY `students`.`surname` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT DISTINCT `degrees`.`name`, `courses`.`name`, `teachers`.`name`, `teachers`.`surname` FROM `courses` JOIN `degrees` ON `degrees`.`id` = `courses`.`degree_id` JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id` JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id` ORDER BY `degrees`.`name` ASC;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT `teachers`.`surname`, `teachers`.`name` FROM `course_teacher` JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id` JOIN `courses` ON `courses`.`id` = `course_teacher`.`course_id` JOIN `degrees` ON `degrees`.`id` = `courses`.`degree_id` JOIN `departments` ON `departments`.`id` = `degrees`.`department_id` WHERE `departments`.`name` = 'Dipartimento di Matematica' ORDER BY `teachers`.`surname` ASC;

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami