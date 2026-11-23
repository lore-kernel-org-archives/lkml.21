Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429540;
	b=JHNf50PVn9aBPChWtnUeeX3Tu6aEzAge4v4rrETiM7r83PFKElHX61DYFkSU/jn6iuki
	 e5nCrCkgIlLI7fG9pzr80GDESATqooPiUXN7A0QOB+lMRgP8mCbMVOP89FAWicC2eeZ+P
	 Csu72bUxDK0gg5D8LxUbNC+CD6iHONKQt0Di7u3bI0llKqAFlizNh8w6Am/iRxdbUBjPq
	 mBHX3QvQvbVERVh3hu1fcYV3/lSyuVemFaw51CCjdnzr5dZNOeijLYaVgAeE/Gyw6dYcS
	 BXh4dcrdEBsy2Urk3h0XBAe6LF5M0LWI5xsHuIksZI9R0Yjh9cC7no4Om+opSkMjqxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=adhFQLImZQirbFPoLtUf2pZq/lJYN4GsRu+tngxUkCU=;
	b=z4fEkwQamFevpoZLIkciHcp8ARHna3uvFGdT3Pv/JWgSgemVPcEgax2EfoanSguAeQ72
	 YHLPfsiCs8uVqlG8qJU4LneH6Afj70crNC5vqpA3HQugWlzeauqmxPZeZ1IfultrxYs4L
	 67QHjHOPYUt6VbYSHRZVF3/rpQs2T8qlhcHciVK3a38EJimRy4+PkcyWOO0hwqSiNE42A
	 ZY0LnMOe4GUboJz4qP/m+R5IX3ECSKBd12aVnAH3/Y3q5Q1J/ZQkd70/nIBKdVP4pXOjd
	 ksrwBzrGYjzjD4a6EOaB/422rqqFIbvxFLA6p/7lXZAN2J/GxGt/tifeiGtSmFz85ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uy87OOjD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NMic/003";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC47F606A682
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC47F606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uy87OOjD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NMic/003
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fsnt1543936
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	adhFQLImZQirbFPoLtUf2pZq/lJYN4GsRu+tngxUkCU=; b=Uy87OOjD+M+H/Cgp
	W4Mm0/BO1WugRB1SeYHgWze84y/G6wDJpnIYqP2i1iXA9SXj8Q5a7acNJvc6eVtB
	gA2t57cXgdFgPVtlJ9cGFfxdggXcYqc6obSojxKxYswhTyLVmM9XErKydwMk533k
	C/Yjn9kst64NcM0bU2oiubzAgrTP/HRzOqJLs1i/Zd/b1aNGGQqkDRgPj8/eTBLB
	cvddWDshVee3WCuICoTPweQsqEks4lDcoPuwc7/AW/i6NLQ/iE23DYYwJ0l/RATi
	kzVVyFaPFe3znakGyzW07wlgzzLlt/J0bKA11gZlhm2E2p1QJRnsVjo5dJwIG/k8
	vdDr0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy00xx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131b4eso589204085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795429538; x=1796034338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adhFQLImZQirbFPoLtUf2pZq/lJYN4GsRu+tngxUkCU=;
        b=NMic/003iKo2gWqt0MmxRpp+Oy1YuG/JH+556AEirB2aTjFAaBkvsdd4K6e8m0oL4h
         ffNaHMmlGiT9oAtIDJR2fZiGQcepAquml3k4iGjvae4fv4Rg89BAkpOQ7wMgjauQ1OXj
         UhZ7oBnFaR3POPqoxNXtoemVHAdFrfTSJC5hOlPT3RXR8Cx5ch8qp+Jl3PdMkT2BsY0x
         ONqzXngc7N8G2MMc5eL/8hxC+ezJcnXHMmVmyl4/rYRh6mCpvQCcZZeZ7anxAuWTwCu8
         FC10eFvML8YbKn8lxxA4aH0KY5AFluAR4vxDhHZ2bU3rUusFoVwJr1+lRjYpdIp6ROQb
         zqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429538; x=1796034338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=adhFQLImZQirbFPoLtUf2pZq/lJYN4GsRu+tngxUkCU=;
        b=VxEqWdnErSIBCIUTEfqcZrz+ABBg5izanQ573qbCiMQKTKyj4jfVcwhj1E5KIiGWxK
         JQz9hBeuvKQRw3lmldMDE5aEWLIL7q+ensgcGcNm/wMIXRbACdWan9ELmSQxdeh2wX1z
         i3w17kvnfJQ9V8kDvXu79x+ZlgTVAbV8NMdVjN+ou2Mi4e5A4uN3ZTbcmazPMiTxr3R1
         n80MPtXnpRcXh0BT4YTKOChkjQ59zgmKDIMkmcQZE+G1h2fjrmIkXCFhemjjuIX/PbRl
         trIWsgjtqrM1Q/UOqn+5/VESQC+7iWdfg8mJHDUHs1KF8wR69Pe0cUTbCLuvZRfxIpwF
         DO6A==
X-Forwarded-Encrypted: i=1; AL+hErEtmHsdiYEzwMWA7r/hTqu8qm5/Yd/C/V+Elz3G3f2RMel2PvQYjrA8TE0motzftFX5JDOppYrrR9NAyHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J5G87Yq7fm2dmS+qEkS7wjQA63i3V3iEvmmM88AssMshtX99v
	abRMcG2d21h2LYIttjwnEbedqNdgAK3A+WUCyuduJ00ZGG0zspp8Ct28E6gdeBgqQUqLrLkAkGk
	A+aOgNNLDhkXEzW06EICHu7NV0ZKYFYYEwzCuoZYENe9jH54VhHSVSpZ/JXthmljNnxk=
X-Gm-Gg: AZFdTZcCrsOJ2PmbKuH3kXSfwlBlSsywAzMZ2HAyTPdR7KxdB7lniku2UDC69V4Wc0S
	iYd8MCog+mYcpJq2bGXiAZgE7/43IauapkTlsO+dxv3CpNt5zc+RGE8J45wlvIpkE/XtnpFyymM
	SLunoaYZDT+HPIvhgNZGRIXT/fRV+rc4//p9uDjgptp1uT0S2NWo6CvwrIrJSmYS9kuRaTo/Wmm
	apuUdGFLbFTeIJ0wgUTvugiZ30mq9E/0ba1nJJIr9w5k+SuIkND0ZECaTbrqnAZnW+Tl5GfVtE9
	wfiUat5ZIcYWITGDPKTQ0S2r9hfOWY6khnqI79+avoP52d5bBRHGqNa4I5zJj2+Sej+gK2Uiba1
	MFbaREcXlq4DDq5mT6BsIL44CBjeoMx0ML6qty44AuAdSoskNjoU0TYpClbrDKnYab2ayIjzfiV
	3X+MdKNY4DEvOtebGbel4wl81+793/5MdaOGv3hX7eLCdFbJ1Zozi8kzHH9Y+mbLayQv9zsi50f
	n0UzUhYnEi6k7fTt/hpLFohJi4A
X-Received: by 2002:a05:620a:280b:b0:949:5e26:e927 with SMTP id af79cd13be357-949bac774f7mr1912581685a.73.1795429537827;
        Mon, 23 Nov 2026 02:25:37 -0800 (PST)
X-Received: by 2002:a05:620a:280b:b0:949:5e26:e927 with SMTP id af79cd13be357-949bac774f7mr1912578385a.73.1795429537376;
        Mon, 23 Nov 2026 02:25:37 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:58b4:dc38:81d5:3c3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm634166845e9.4.2026.11.23.02.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:25:36 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:32 +0100
Subject: [PATCH v8 1/8] Bluetooth: hci_qca: Add M.2 Bluetooth device
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
Message-Id: <20261123-monza-wireless-v8-1-a8b38604be6c@oss.qualcomm.com>
References: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfXw1GyaSpHyefn
 GA7zx8rxsGmDbe1aitmx5njiqJ+pH1m+DB4LZv2mYFbZ+3yVANVk99Zd6nD4CSZVsydnd/3O9Fq
 Wmcis8PXZLO3VtmpBSsym2YPAUnjtmfum9fJjgOBfTZed/qmr1xUTRNcuovdT9y40N9rfTJachE
 D1ZqXdqgu95S4hVbOYl+q4XIP3EyWalNp8RkSUMrOSiORxPs01ofxEMvDslYkob7n1LqkwAjqbq
 cXqsqW3v/afyVAPdBzigwXcFoSJt70ATOLh8VQzwV32DbH2VX7plVFWpyyF9zQnnNjdWnMEnxgH
 jYuCk8WzgRMxDrUS41qcnckE/5RlWa5XKLylEvqP2vnYWRlMmHnK0FLCVTTxseyCMlWpkTzYYgP
 zc3v4x2bsAUcWZ/WtrhGUUqFv95/Rg1yMwkA5bnAwQSoTi2FijSYZ0wTVb44RHEZEH2GLJ5QKcM
 HwIFSdVVh4MgyzG4Z/w==
X-Proofpoint-ORIG-GUID: IniNEi7Tftt5L5l54NNAy9Mv1_QT9sNs
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0414a2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=nT8YUeIo8neH6xSWzyEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: IniNEi7Tftt5L5l54NNAy9Mv1_QT9sNs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX8A8onV1MTz8j
 KjKQ4i9a+UVELPOTfT0cNIKR/5bXQbvYDS0HhxVS8CQay9app7h/td92OBYPFlLK/Iu+JCszvKA
 WxRicpWI87SPf5iT8nGMwKOCgu2FJ8s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230041

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
index 158f294c18902a0908a400fae552ed5ad9fe0240..998796ea618822298d7f956a00c6c50f14332363 100644
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
@@ -2490,6 +2531,14 @@ static int qca_serdev_probe(struct serdev_device *serdev)
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

