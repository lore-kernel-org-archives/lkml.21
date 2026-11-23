Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442177;
	b=lq9e/7A35QLwf5dSdA6h7oepFPSrwrMeB1nS81idluL4pGKN8bAzIQunDId75BjVmarF
	 Egz6iLwjMA+D03pCB8dxtUnpf97pU25EZb6oeiyBiyCs69WsrfKCrvY1cUA7KSO97IEZq
	 Q7IqJ0c6rofWEFiXWwfhek6srKJVAx0x7WV4lqkDrToI/gvwWsYWdKIuWu5XTC2peSZAV
	 prAMhneXVuooRvtMPRpdcnCBwuKQDQ7xyc4Aql52SZ0QPjVHbE0QHZ9u54FHHOyqf3ByF
	 vDdQmUVlkqEog3nED6PH+KUrni53xUxAiBYwRKyeCpztqpktyY17eDeK7XNXBViTnKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m5HVoyvcOYYPn841BrG9bcSw+LozVDgWcsxFSE0WYck=;
	b=0ieTJDxirmgiJSyqdCbpk7GS0KNiB7tHoMBkLvggK/XEwzKmsEfQ/+5N3tMXvbPB2jkb
	 3VpJOa1+3zTs1WUCISeuxzMoJDfw16Or5C1aQctl1eedACHLoTdjwY+TfoFfMrvIT15GK
	 cetBOoF0SW02b9yhumXf7GzA3CWBroHNTWAnarEko0WTaY0iVP4HuvuXKHtG3/yxMiKCu
	 kFtl4yvXRz/D16EAT1qRvIvqXmXik+E9GgLxFy5Kjjto+1zfGWAfpHH7gjV7kmZMfcjvc
	 bfzB4p1exj88YT/z+oXhk7xO1+yVYkjErdOurqz+3X+WdoOfkA1OU7NfxBkp5JQv5xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQwhuwMK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iOlVOy8+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE90606A6AB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE90606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQwhuwMK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iOlVOy8+
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL3M92086094
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m5HVoyvcOYYPn841BrG9bcSw+LozVDgWcsxFSE0WYck=; b=cQwhuwMKG4HuwC/w
	C5jRFE9QyYl59JDVP3l79g5VRJB+LHFLySF4CDEcrB04fxFXRZLVYm2k5Dh71dX7
	mYgiFyAB1p9E+GHRoXXYyrGajeGvn3I1dFkHc+ow9riNQVBFP9YX9TPjgtQw2htb
	81Y8/LgBgmU+2Wq2Y+hFewPITf/wWAbGpsB9lmclX9iUQfSNC7K7Y8BAWYcHAxlK
	AAzKKu8RUMJf1RTMdvl5L26874RmOCqQaa6G/61JxXkOLUyvGZihI7uJ+X24O2cX
	Vw5C42XQJsiU7oLlL5OK2/PNpWsht7IHuOvKqV8Fw+35yD8EmhH4mwspAnAAeW68
	fuWleg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy01np5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:56:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so533602285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442174; x=1796046974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5HVoyvcOYYPn841BrG9bcSw+LozVDgWcsxFSE0WYck=;
        b=iOlVOy8+2jJ4QyZnpcc+BtQXgi8jEnmqKrEXMW6iTfqUntot4pwLR9uXv9pMa93drA
         EaQ3xFgiuVJS9/69C9F8ekgCfwbD1Rit2HfywZlgOT9IcMvZ6+6YsBcFGMLFI3VGSOxD
         us9RD5K1W1YYOwWdqqbebsUxlD5lqS7bF1cD7nhtIksg+HXNsmvukQPz5Vy19wQ7gHbs
         uZaVRT4Jiqsxk0jP6ayuYXhiBryCk1PwskMIz7UX4xuDwPP0IXbw3e4clQ3zcHwbIa1r
         MLYeO8h6FmFEAhRqdR/FeS/mDIwI9l9BsvqI2fJlkqzgm2or4cxEY9l8cNN0RVyZxqku
         7trQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442174; x=1796046974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5HVoyvcOYYPn841BrG9bcSw+LozVDgWcsxFSE0WYck=;
        b=u7MJjhP2kMveoR15z8nFaJUSbYJ2BkIzThOEotF5WQbxriTlFnmNGgH6kaw/9BrkeA
         CZ9Uj2lfJ3VRvjyNqn5xB6lSWWrBdqcH8BPFEu/L1S9ZujWiPUuHB6F56YRfN5CP/6p4
         NT++mQvBUx/EM0AEjOVidS5Hb6GtyU+9mtSGx6zyuAoZpMKgN33FQc6NIcaLGeDWTtZA
         atoqqO2qD4IG4wh1qNjpwBzmykgStlGjj7FD/gYahOndUQs8YcmMxKkR575SldAHOJ9d
         +mxXjvsOOGd5Njg3HerFOekfxJb71HjghP0QjdQs31evm2UvzycQXtXKhBCYj/BtFFkk
         +jDQ==
X-Forwarded-Encrypted: i=1; AL+hErGPpgnBN6a+WO2+nUqjhjSjkWJS61gW0BhOQoYesSiCq1W5L0Zj2fMrwSHtFnIVA0c/iXagLwP9+1iTzEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yp0j8ZjVlEovaKs3x8tFaLhF7JLj7x/OzZ6uX1jxBoK/p1VUd
	V59vyx0eir/rPRzHQHXLxCew93hHCvfU3KyOWKIvK820EpZw0rYJbpIP9mCEY9Oj5vRxvTHORXN
	PJFdeBayMDazxJW4fzx7eG1ZM3YPONEtJZlH6Bb3f8CtVvj3q3wrLlZNBjjuuRk9s2SA=
X-Gm-Gg: AZFdTZc+WrQMt/N6yO7KMQY1sYM1g/aaf6LQejsEyANH+OGpXkE/UrsTylfZc3b2eki
	5fKRliN7FxW77ddM28XbFNEpfTwzjypRDDH3Xy2K6rTZihR0M3GzEN6ytZq9oijyiY7YYApLmUL
	5iCzvLSy57+Zh/0l4DqzQc5l9SQud+Y+SkUZl77CaHxwutcw/Cvff/Ey1aq0X82W8F29mxv0dfp
	Vvxkwvy06gITitDHy7qGkp2gKdT/AqDDpuPJugCgPSLDVF2er232FeCxBSeOn6Z+cTtBL73rIum
	W/iqO5KFNbJLJTQUyYNQeACzCEkc5UAxqCQoa+XvOhEBJEDF+0KUvAouH9TgDsLIw+OvR9eSOQ1
	iNLX4g7wteCLLt9Eitk52381zu5sXUwvTyPBbsVcphDCoKdTq4ex96yfV9H0iPru/dfhlMlTF5h
	kqazS6HC+11DJIaJJ1Tg23UUVcB61PgM+CD0xqoYvejGYbb+8/rb6pnX59nh5uZfJLUunsKXn6L
	doK12fADafHA++M93ixWcU+xXR6
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr1786391085a.23.1795442174336;
        Mon, 23 Nov 2026 05:56:14 -0800 (PST)
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr1786386585a.23.1795442173721;
        Mon, 23 Nov 2026 05:56:13 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21724625f8f.56.2026.11.23.05.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:56:13 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:56:08 +0100
Subject: [PATCH v9 1/8] Bluetooth: hci_qca: Add M.2 Bluetooth device
 support using pwrseq
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-monza-wireless-v9-1-450d7d764aea@oss.qualcomm.com>
References: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Jesse Casco <jesse.casco@gmail.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX3xgOH8ZmeT2A
 XwTHEfFn4MrB83L1vQk9Z3BFHRevQXCHyUk8iSgHZKksxyJnYyO+TjzRdNon00EvOdYVdidnmgT
 Eo71pdIGX4nXJ1+0shjkPNWQZAth3YciZan6AjH8DkDzXR302YY2365MF+3BlaqveGAasvTqyXd
 pTaY+fEbkqyqhbLirSCVfl3zM54GfDAbOklTfLIPoNopXk7URWuOVHJSaw8Br8JvMy0i9HC5CK/
 8qfgu6eNlMw8+sFDuaw6GG+vnK3Z2C5mepwBBy41qWPmjE8SZtKP5asC4ij8GyHVRXtnqheAs4p
 efkW1Vij0rcWC/37O2ftCg4/gtWyoctZYlIWucuUzRUKnTyE0oGCtMd1+0DV2fus+WRySXf/H4R
 ZTCc9IoxtiY3NU9KJrKJPS+l+tbSg3e58YM4jIEVcD2q0b3vm8t3OJkmfH96Vv9H6CPxserZKGy
 QUsc8alYE2syZyD+VMg==
X-Proofpoint-ORIG-GUID: 2bxB2EurVy0UyVy1BQk0_VsQovfp-A2b
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0445ff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=oxJxktCAzv21rYXR6MwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 2bxB2EurVy0UyVy1BQk0_VsQovfp-A2b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX4S5eth1sCrHj
 Rnadn8Jk+WU8Qg8+7Ka23okgTBr/QywF88Jn5GTjadBsY34FBU2hqqiEByL/iQ6WTUzAetik6bO
 x/uT4KFjbw0di34jsrT+TXoXhtLs0+Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230055

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Power supply to the M.2 Bluetooth device attached to the host using M.2
connector is controlled using the 'uart' pwrseq device. So add support for
getting the pwrseq device if the OF graph link is present. Once obtained,
the existing pwrseq APIs can be used to control the power supplies of the
M.2 card.

The descriptor is looked up on the serdev controller, since that is
the node holding the OF graph link to the connector, but it must be
released when the Bluetooth serdev device goes away rather than when
the UART controller does. Acquire it with pwrseq_get() and hand the
release to a devres action bound to the serdev consumer instead of
using devm_pwrseq_get() on the controller.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
Tested-by: Jesse Casco <jesse.casco@gmail.com> # ASUS Zenbook A16 (UX3607OA)
---
 drivers/bluetooth/hci_qca.c | 49 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index d693e28427251e9357019c192c030b837ebb2bb9..c4e42c9542adaddee17e256eb017902ef565025f 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -25,6 +25,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/pwrseq/consumer.h>
@@ -2430,6 +2431,46 @@ static int qca_init_regulators(struct qca_power *qca,
 	return 0;
 }
 
+/*
+ * A BT device attached through an M.2 Key E connector is described by an OF
+ * graph link from the serdev controller to the connector node. Resolve the
+ * remote endpoint instead of merely testing for the presence of a local
+ * 'port', as some device trees carry an unconnected port anchor which must
+ * not be mistaken for an M.2 connector.
+ */
+static bool qca_serdev_is_m2(struct serdev_device *serdev)
+{
+	struct device_node *connector __free(device_node) =
+		of_graph_get_remote_node(dev_of_node(&serdev->ctrl->dev), 0, 0);
+
+	return !!connector;
+}
+
+static void qca_serdev_put_pwrseq(void *data)
+{
+	pwrseq_put(data);
+}
+
+static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
+{
+	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
+	struct pwrseq_desc *pwrseq;
+
+	/* The pwrseq is looked up on the serdev controller (which holds the
+	 * OF graph to the M.2 connector), but its lifetime must follow this
+	 * serdev consumer device, not the controller. So acquire it with the
+	 * non-devres pwrseq_get() and release it via a devres action bound to
+	 * &serdev->dev instead of using devm_pwrseq_get(&serdev->ctrl->dev).
+	 */
+	pwrseq = pwrseq_get(&serdev->ctrl->dev, "uart");
+	if (IS_ERR(pwrseq))
+		return PTR_ERR(pwrseq);
+
+	qcadev->bt_power->pwrseq = pwrseq;
+
+	return devm_add_action_or_reset(&serdev->dev, qca_serdev_put_pwrseq, pwrseq);
+}
+
 static int qca_serdev_probe(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev;
@@ -2491,6 +2532,14 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_QCA2066:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+		if (qca_serdev_is_m2(serdev)) {
+			err = qca_serdev_get_m2_pwrseq(qcadev);
+			if (err)
+				return err;
+
+			break;
+		}
+
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the

-- 
2.34.1

