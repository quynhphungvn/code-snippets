package quynh.java.webapp.codesnippet.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "frontend_code")
public class FrontendCode {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String description;
    @Column(name = "html_content")
    private String htmlContent;
    @Column(name = "css_content")
    private String cssContent;
    @Column(name = "js_content")
    private String jsContent;
    private String comment;
    @ManyToOne
    @JoinColumn(name = "code_group_id")
    private CodeGroup codeGroup;
}
