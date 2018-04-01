package com.notebookservice.validator;

import com.notebookservice.model.Issue;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class IssueValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Issue.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Issue issue = (Issue) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "Name", "Required");
        if (issue.getName().length() < 3 || issue.getName().length() > 32) {
            errors.rejectValue("Name", "Size.issueForm.Name");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "Description", "Required");
        if (issue.getDescription().length() < 8 || issue.getDescription().length() > 32) {
            errors.rejectValue("Description", "Size.issueForm.Description");
        }
    }
}
