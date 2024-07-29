import HTMLKit
import HTMLKitComponents

enum PrivacyPage {
    
    struct IndexView: View {
        
        var viewModel: PrivacyPageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    Text {
                        viewModel.title
                    }
                    .textStyle(.subheadline)
                }
                Section {
                    HStack(alignment: .top, spacing: .large) {
                        VStack(spacing: .large) {
                            Text {
                                "General information"
                            }
                            .bold()
                            .fontSize(.medium)
                            Text {
                                "The following information will provide you with an easy to navigate overview of what will happen with your personal data when you visit this website. The term &ldquo;personal data&rdquo; comprises all data that can be used to personally identify you. For detailed information about the subject matter of data protection, please consult our Data Protection Declaration, which we have included beneath this copy."
                            }
                            .fontSize(.medium)
                            Text {
                                "Data recording"
                            }
                            .bold()
                            .fontSize(.medium)
                            VStack {
                                Text {
                                    "Who is the responsible party for the recording of data on this website?"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "The data on this website is processed by the operator of the website, whose contact information is available under section “Information about the responsible party (referred to as the “controller” in the GDPR)” in this privacy policy."
                                }
                                .fontSize(.medium)
                            }
                            VStack {
                                Text {
                                    "How do we record your data?"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "We collect your data as a result of your sharing of your data with us. This may, for instance be information you enter into our contact form. Other data shall be recorded by our IT systems automatically or after you consent to its recording during your website visit. This data comprises primarily technical information (e.g., web browser, operating system, or time the site was accessed). This information is recorded automatically when you access this website."
                                }
                                .fontSize(.medium)
                            }
                            VStack {
                                Text {
                                    "What are the purposes we use your data for?"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "A portion of the information is generated to guarantee the error free provision of the website. Other data may be used to analyze your user patterns."
                                }
                                .fontSize(.medium)
                            }
                            VStack {
                                Text {
                                    "What rights do you have as far as your information is concerned?"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "You have the right to receive information about the source, recipients, and purposes of your archived personal data at any time without having to pay a fee for such disclosures. You also have the right to demand that your data are rectified or eradicated. If you have consented to data processing, you have the option to revoke this consent at any time, which shall affect all future data processing. Moreover, you have the right to demand that the processing of your data be restricted under certain circumstances. Furthermore, you have the right to log a complaint with the competent supervising agency. Please do not hesitate to contact us at any time if you have questions about this or any other data protection related issues."
                                }
                                .fontSize(.medium)
                            }
                            VStack {
                                Text {
                                    "Hosting provider"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    MarkdownString {
                                        "We are hosting the content of our website at IONOS SE, Elgendorfer Str. 57, 56410 Montabaur, Germany. Whenever you visit our website, IONOS records various logfiles along with your IP addresses. For details, please consult the data privacy policy of IONOS: [Link](https://www.ionos.de/terms-gtc/terms-privacy). We use IONOS on the basis of Art. 6 (1)(f) GDPR. Our company has a legitimate interest in presenting a website that is as dependable as possible. If appropriate consent has been obtained, the processing is carried out exclusively on the basis of Art. 6(1)(a) GDPR and § 25 (1) TTDSG, insofar the consent includes the storage of cookies or the access to information in the user’s end device (e.g., device fingerprinting) within the meaning of the TTDSG. This consent can be revoked at any time."
                                    }
                                }
                                .fontSize(.medium)
                            }
                            .tag("hosting-provider")
                            Text {
                                "Mandatory information"
                            }
                            .bold()
                            .fontSize(.medium)
                            VStack {
                                Text {
                                    "Data protection"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "The operators of this website and its pages take the protection of your personal data very seriously. Hence, we handle your personal data as confidential information and in compliance with the statutory data protection regulations and this Data Protection Declaration. Whenever you use this website, a variety of personal information will be collected. Personal data comprises data that can be used to personally identify you. This Data Protection Declaration explains which data we collect as well as the purposes we use this data for. It also explains how, and for which purpose the information is collected. We herewith advise you that the transmission of data via the Internet (i.e., through e-mail communications) may be prone to security gaps. It is not possible to completely protect data against third-party access."
                                }
                                .fontSize(.medium)
                            }
                            .tag("data-protection")
                            VStack {
                                Text {
                                    "Information about the responsible party"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "The data processing controller on this website is: Matthias Mohr, Bamberg, Bayern, Deutschland, mail@mattesmohr.de"
                                }
                                .fontSize(.medium)
                                Text {
                                    "The controller is the natural person or legal entity that single-handedly or jointly with others makes decisions as to the purposes of and resources for the processing of personal data (e.g., names, e-mail addresses, etc.)."
                                }
                                .fontSize(.medium)
                            }
                            .tag("responsible-party")
                            VStack {
                                Text {
                                    "Storage duration"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "Unless a more specific storage period has been specified in this privacy policy, your personal data will remain with us until the purpose for which it was collected no longer applies. If you assert a justified request for deletion or revoke your consent to data processing, your data will be deleted, unless we have other legally permissible reasons for storing your personal data (e.g., tax or commercial law retention periods); in the latter case, the deletion will take place after these reasons cease to apply."
                                }
                                .fontSize(.medium)
                            }
                            .tag("storage-duration")
                            VStack {
                                Text {
                                    "General information on the legal basis for the data processing on this website"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "If you have consented to data processing, we process your personal data on the basis of Art. 6(1)(a) GDPR or Art. 9 (2)(a) GDPR, if special categories of data are processed according to Art. 9 (1) DSGVO. In the case of explicit consent to the transfer of personal data to third countries, the data processing is also based on Art. 49 (1)(a) GDPR. If you have consented to the storage of cookies or to the access to information in your end device (e.g., via device fingerprinting), the data processing is additionally based on § 25 (1) TTDSG. The consent can be revoked at any time. If your data is required for the fulfillment of a contract or for the implementation of pre-contractual measures, we process your data on the basis of Art. 6(1)(b) GDPR. Furthermore, if your data is required for the fulfillment of a legal obligation, we process it on the basis of Art. 6(1)(c) GDPR. Furthermore, the data processing may be carried out on the basis of our legitimate interest according to Art. 6(1)(f) GDPR. Information on the relevant legal basis in each individual case is provided in the following paragraphs of this privacy policy."
                                }
                                .fontSize(.medium)
                            }
                            .tag("data-processing")
                            VStack {
                                Text {
                                    "Recipients of personal data"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "In the scope of our business activities, we cooperate with various external parties. In some cases, this also requires the transfer of personal data to these external parties. We only disclose personal data to external parties if this is required as part of the fulfillment of a contract, if we are legally obligated to do so (e.g., disclosure of data to tax authorities), if we have a legitimate interest in the disclosure pursuant to Art. 6 (1)(f) GDPR, or if another legal basis permits the disclosure of this data. When using processors, we only disclose personal data of our customers on the basis of a valid contract on data processing. In the case of joint processing, a joint processing agreement is concluded."
                                }
                                .fontSize(.medium)
                            }
                            .tag("data-recipients")
                            VStack {
                                Text {
                                    "Revocation of your consent to the processing of data"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "A wide range of data processing transactions are possible only subject to your express consent. You can also revoke at any time any consent you have already given us. This shall be without prejudice to the lawfulness of any data collection that occurred prior to your revocation."
                                }
                                .fontSize(.medium)
                            }
                            .tag("constent-revocation")
                            VStack {
                                Text {
                                    "Right to object to the collection of data in special cases; right to object to direct advertising (Art. 21 GDPR)"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "IN THE EVENT THAT DATA ARE PROCESSED ON THE BASIS OF ART. 6(1)(E) OR (F) GDPR, YOU HAVE THE RIGHT TO AT ANY TIME OBJECT TO THE PROCESSING OF YOUR PERSONAL DATA BASED ON GROUNDS ARISING FROM YOUR UNIQUE SITUATION. THIS ALSO APPLIES TO ANY PROFILING BASED ON THESE PROVISIONS. TO DETERMINE THE LEGAL BASIS, ON WHICH ANY PROCESSING OF DATA IS BASED, PLEASE CONSULT THIS DATA PROTECTION DECLARATION. IF YOU LOG AN OBJECTION, WE WILL NO LONGER PROCESS YOUR AFFECTED PERSONAL DATA, UNLESS WE ARE IN A POSITION TO PRESENT COMPELLING PROTECTION WORTHY GROUNDS FOR THE PROCESSING OF YOUR DATA, THAT OUTWEIGH YOUR INTERESTS, RIGHTS AND FREEDOMS OR IF THE PURPOSE OF THE PROCESSING IS THE CLAIMING, EXERCISING OR DEFENCE OF LEGAL ENTITLEMENTS (OBJECTION PURSUANT TO ART. 21(1) GDPR). IF YOUR PERSONAL DATA IS BEING PROCESSED IN ORDER TO ENGAGE IN DIRECT ADVERTISING, YOU HAVE THE RIGHT TO OBJECT TO THE PROCESSING OF YOUR AFFECTED PERSONAL DATA FOR THE PURPOSES OF SUCH ADVERTISING AT ANY TIME. THIS ALSO APPLIES TO PROFILING TO THE EXTENT THAT IT IS AFFILIATED WITH SUCH DIRECT ADVERTISING. IF YOU OBJECT, YOUR PERSONAL DATA WILL SUBSEQUENTLY NO LONGER BE USED FOR DIRECT ADVERTISING PURPOSES (OBJECTION PURSUANT TO ART. 21(2) GDPR)."
                                }
                                .fontSize(.medium)
                            }
                            .tag("data-objection")
                            VStack {
                                Text {
                                    "Right to log a complaint with the competent supervisory agency"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "In the event of violations of the GDPR, data subjects are entitled to log a complaint with a supervisory agency, in particular in the member state where they usually maintain their domicile, place of work or at the place where the alleged violation occurred. The right to log a complaint is in effect regardless of any other administrative or court proceedings available as legal recourses."
                                }
                                .fontSize(.medium)
                            }
                            .tag("complaint-log")
                            VStack {
                                Text {
                                    "Right to data portability"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "You have the right to have data that we process automatically on the basis of your consent or in fulfillment of a contract handed over to you or to a third party in a common, machine-readable format. If you should demand the direct transfer of the data to another controller, this will be done only if it is technically feasible."
                                }
                                .fontSize(.medium)
                            }
                            .tag("data-portability")
                            VStack {
                                Text {
                                    "Information about, rectification and eradication of data"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "Within the scope of the applicable statutory provisions, you have the right to demand information about your archived personal data, their source and recipients as well as the purpose of the processing of your data at any time. You may also have a right to have your data rectified or eradicated. If you have questions about this subject matter or any other questions about personal data, please do not hesitate to contact us at any time."
                                }
                                .fontSize(.medium)
                            }
                            .tag("data-eradication")
                            VStack {
                                Text {
                                    "Right to demand processing restrictions"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "You have the right to demand the imposition of restrictions as far as the processing of your personal data is concerned. To do so, you may contact us at any time. The right to demand restriction of processing applies in the following cases: In the event that you should dispute the correctness of your data archived by us, we will usually need some time to verify this claim. During the time that this investigation is ongoing, you have the right to demand that we restrict the processing of your personal data. If the processing of your personal data was/is conducted in an unlawful manner, you have the option to demand the restriction of the processing of your data instead of demanding the eradication of this data. If we do not need your personal data any longer and you need it to exercise, defend or claim legal entitlements, you have the right to demand the restriction of the processing of your personal data instead of its eradication. If you have raised an objection pursuant to Art. 21(1) GDPR, your rights and our rights will have to be weighed against each other. As long as it has not been determined whose interests prevail, you have the right to demand a restriction of the processing of your personal data. If you have restricted the processing of your personal data, these data – with the exception of their archiving – may be processed only subject to your consent or to claim, exercise or defend legal entitlements or to protect the rights of other natural persons or legal entities or for important public interest reasons cited by the European Union or a member state of the EU."
                                }
                                .fontSize(.medium)
                            }
                            .tag("processing-restrictions")
                            VStack {
                                Text {
                                    "SSL and/or TLS encryption"
                                }
                                .bold()
                                .fontSize(.medium)
                                Text {
                                    "For security reasons and to protect the transmission of confidential content, such as purchase orders or inquiries you submit to us as the website operator, this website uses either an SSL or a TLS encryption program. You can recognize an encrypted connection by checking whether the address line of the browser switches from “http://” to “https://” and also by the appearance of the lock icon in the browser line. If the SSL or TLS encryption is activated, data you transmit to us cannot be read by third parties."
                                }
                                .fontSize(.medium)
                            }
                            .tag("ssl-encryption")
                        }
                        .frame(width: .nine)
                        VStack {
                            Text {
                                "Quick navigation"
                            }
                            .bold()
                            List(direction: .vertical) {
                                Link(destination: "#data-recording") {
                                    Text {
                                        "Data recording"
                                    }
                                }
                                Link(destination: "#hosting-provider") {
                                    Text {
                                        "Hosting provider"
                                    }
                                }
                                Link(destination: "#data-protection") {
                                    Text {
                                        "Data protection"
                                    }
                                }
                                Link(destination: "#responsible-party") {
                                    Text {
                                        "Responsible party"
                                    }
                                }
                                Link(destination: "#storage-duration") {
                                    Text {
                                        "Storage duration"
                                    }
                                }
                                Link(destination: "#data-processing") {
                                    Text {
                                        "Data processing"
                                    }
                                }
                                Link(destination: "#data-recipients") {
                                    Text {
                                        "Data recipients"
                                    }
                                }
                                Link(destination: "#constent-revocation") {
                                    Text {
                                        "Consent revocation"
                                    }
                                }
                                Link(destination: "#data-objection") {
                                    Text {
                                        "Data objection"
                                    }
                                }
                                Link(destination: "#complaint-log") {
                                    Text {
                                        "Complaint log"
                                    }
                                }
                                Link(destination: "#data-portability") {
                                    Text {
                                        "Data portability"
                                    }
                                }
                                Link(destination: "#data-eradication") {
                                    Text {
                                        "Data eradication"
                                    }
                                }
                                Link(destination: "#processing-restrictions") {
                                    Text {
                                        "Processing restrictions"
                                    }
                                }
                                Link(destination: "#ssl-encryption") {
                                    Text {
                                        "SSL encryption"
                                    }
                                }
                            }
                        }
                        .frame(width: .three)
                    }
                }
            }
        }
    }
}
