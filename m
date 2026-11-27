Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790469;
	b=XECo7JscLtNFLgEwpk4KdkVzlcVOilH8VLAfNVfJJiza3vGDpM4xOFu94Kl5WxMFKBeA
	 RlTMtWJsOSXBa7GC5x8zfzwq1yyj/IEswIzaknbPYWrZdNe7bhJW4OcmwGvFGn5DsOmH1
	 b61WckJd29P04v7JAQOyQ+MNEi5BOFI1dEo+BII3in55Je3CN+9EO7q7tWiG3x4yxFZX2
	 Zc9C+zsS9SO+Y296WXJuQ4EBYp5J8OZzGzvPls/lj/OhTto+lNPd6O17PVSWEvZCFn0NQ
	 o4N/u8HHHOzbK1IQlJmA1wJZpnbMJxXE0yC/hBAN0AAC+mpxKb0PZpu2QD5aTG7eetA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cQrPmeNJla6MknwzStsoB43gW4Bhd7IUtxWsEgN5PGY=;
	b=01GY329t5d4Am1XEXXoPFsfoh/uZCZq08MKuzXyWbY1ZHph7f7NMb6WTSthruNOfwEYW
	 MZ8hbEyD28m4ZC1yp3eIVul6AFavPf/0RTL2xDaLUizcklq0I19HNKAHyJPfxvBcKyjvH
	 ZXbeRhuz84MRXgXmP6S+QU4jJJVlXjSelgXXZRzQVXQy3ZAuVZDrCMHxps48wbzNAgpew
	 HxIY8ir4YUTMhalxdU0h7uBhTDkdI+eUwgW/26uM2bvemBjafPoz804SNwr/jsYz4Wnwf
	 L3g3i/uR8LtDFXpSO1o484f1MS1IKMaILLtwUZIIxjpx6pVkm2hw3jiHX/Hlz0fMBXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hgNdX3u2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2VlyVtq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D02606A69B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16D02606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hgNdX3u2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2VlyVtq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Rnh2376469
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQrPmeNJla6MknwzStsoB43gW4Bhd7IUtxWsEgN5PGY=; b=hgNdX3u2YU/EMaza
	AbJzE8XdBraumYCE4WUnXKEElOyIqqLgUANYohccrXdvNw7sOD7njBDyLzKN7f3k
	HzWS3rf4w94gwoNBGu5AeG06jdc/+vA2oH3WndZNS8jq3xuPl12lk1AWrByda+Eo
	8f5HUd9UkPHNrF2R2/YIN69pWDaVgqFfQ9lbJvF+UHpcCPxWXIDhQRB8R4ZBEs55
	Sr4l99Au0uxzKri0Ir2Akgd9CzoOlzW/A+/P0WRTmpd5aLcOmrBtiU0kfZ2TXjGm
	IrMcy//UfS4M+igEz3Res6og9OLG944ZQf5yi3qfmUju27MoYU1JaVMrmlR6a7rB
	PDtQhQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hug8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:41:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso8332223eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795790468; x=1796395268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQrPmeNJla6MknwzStsoB43gW4Bhd7IUtxWsEgN5PGY=;
        b=J2VlyVtqd52egO3nBHopjItviu89CVAAeL012+LYtZ/31IQwaxW/mjy1PgkWllZtuB
         Iio4D5VZMADguH5DDDj/KAMYhrsVBa/krpIjcfIYrBZ2lvYqMWpYZjv9fQAhNsQkeqcW
         yWyL7bb0N8kvbqeJCPZRADJXnLqnKAzU0C875X7DXoTd32Sd18Zr5DcaLr5vQx7wLaEN
         LVS4r4WMoQTYZPrhiytMZ8KJ2Yq4ItqhahRm5RIKeahphWmP7hy78NXc7+uAmm/o1kLM
         XCn/xd+0z5VL70NaA51c26+Xnyz+x6Rnalhe7JkcUppiRq5fkdCIA0Mr0dJhgd7XcmHK
         EZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790468; x=1796395268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQrPmeNJla6MknwzStsoB43gW4Bhd7IUtxWsEgN5PGY=;
        b=jy/xgesg6DtCUcTa9aHKJ4zDe3rM5aCxRg8FGs3kdSrrKdesMducAkiRazkGCkg0gQ
         +cDLB60IlW57ie5P6fKWt+h5z9NNn6mD8zy7RoMY4MQD1w6cFtS1EPb+1avTfqGouYcJ
         gd2wrSaBZ+nJ2t0Li8aTWUPykaOcUiRz4gSPzCsgpip6GTyG+k0pdOA6szy808KKWLJY
         C0sxxtdkvJTteKKtG5rHMrF7OBj+ZY43JOtSU/zZaxs9+obR+mYfvV/l/XAbYbAWmJXo
         +qDpZFBBd+/3B60Oe/aM+wjLC0r2J7wX+Hnv1qJSZn37MA8ZI8Kr70G+TXgpM0SlmhR6
         6q6A==
X-Forwarded-Encrypted: i=1; AL+hErEbldaOUq5QwP5OfU2NTOxgMS0f+snyP8+cgBVMLtFIAj3GhhgO/Vez3S+iYznk6g8SLK4oKOfpy72WrnU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BQGHzO7k4MlFEs9slTYo6V45PjWDrRDpuZlca+XbEqI7uGj2M
	/CtebOV615feTObV6tSNCvv7lffYgLhe6qVFWFz18pGJDpRzpO20MeiCurlcsuDurcEhVyytmlK
	Ad/LVzTFTHUMepU73MTypfa+PHHSdTLuv7o4PeytXjrqmxdxiihz0jKRvrvYuoosQcaL8Y8wLoz
	s=
X-Gm-Gg: AZFdTZe/Dp52tOmpOeWyvfNTt7eGWg8P5rMpGorZj9poJCyySNgviW5ycs85eSxTXdK
	Zt+/e7iJLOn0pJJ2qQEv/qjLPgQnCh7SLWmS5CbJQXlh8sTRy0iQBuGMWejDzPI8n0e7RxuJSjk
	/9Ge7tdRU3JPIP5DT9qGq6YjNAj1sNxoXM0c04LatxQsjLvX/WNHzrOBYZtTbUbYS8nBF2EX691
	oxbr7YqvWWTIUCi/PaHBtZpZEU5AJYi/gs7X8zJEXdb/fWDJk35DwLb1h/U8ZxaPrrhY1+L6XOw
	7c5e93k9EkiYEkY+qmgnKRTMkhrMTv0vI8R7/g6gUg0MIP75God68/jgzEA7ZZcbDMqo3Xw9wh4
	B0NToY7KSBocTKAieHGwQhv38nLKNV1pyOEsRRcCsjFiAHZC4QlOtIv+xh6oiasvLabQ/vHkKQ4
	B0d2b2Ag==
X-Received: by 2002:a05:7301:5098:b0:381:5fe2:a079 with SMTP id 5a478bee46e88-3856c6b010amr24691108eec.1.1795790467420;
        Fri, 27 Nov 2026 06:41:07 -0800 (PST)
X-Received: by 2002:a05:7301:5098:b0:381:5fe2:a079 with SMTP id 5a478bee46e88-3856c6b010amr24691082eec.1.1795790466715;
        Fri, 27 Nov 2026 06:41:06 -0800 (PST)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm82970809eec.26.2026.11.27.06.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:41:06 -0800 (PST)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 20:10:49 +0530
Subject: [PATCH v2 1/2] PCI: qcom: Implement .reset_root_port() for
 firmware-managed controllers
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
Message-Id: <20261127-pcie-controller-reset-v2-1-17467b64f5f5@oss.qualcomm.com>
References: <20261127-pcie-controller-reset-v2-0-17467b64f5f5@oss.qualcomm.com>
In-Reply-To: <20261127-pcie-controller-reset-v2-0-17467b64f5f5@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rama Krishna <rama.krishna@oss.qualcomm.com>,
        Nitesh Gupta <nitesh.gupta@oss.qualcomm.com>,
        Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795790457; l=2937;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=nTCJouOPtcRST+Npmv3BTg5gqJs09AaCB0vd/5YgXDY=;
 b=hk/C9j7skE13T+ziWxNra+8H8OVQfs20SUhjh+HIdAAH8vDVYQESC1zJqoVdW/Kq3CsW8II4S
 j7ii4X1KwaBCMhrcMMrlWbSCe7lWdzrMWgk2BH9t5pcN6ZrGUEBf187
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX15YITqEGrm5o
 YKwwoH5y/+Rz+zB6TB5CJMrgkUuYwZmC/w6iIilY4vKYbCe80lDbBaFLzS+qNzkNT5Aw3fDP8ER
 JOLw/BINnpFej6E8jYyykFEztl99Yp4=
X-Proofpoint-GUID: JbRBviECu0d0WvFlfIKqE5Jjqyaxt2qH
X-Proofpoint-ORIG-GUID: JbRBviECu0d0WvFlfIKqE5Jjqyaxt2qH
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b099684 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_Z1ICBCpGxnOzRxCLNAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfXz846lQI0nByn
 NIJeG+zBG2+MCEAHZ8m8LwbB3AMxG7hmLtVzCCxkEBcGVmuy+teQ1g6kNgJLp76wUHiyx7yegBD
 WL51nGpE1xgeeqrqJFwM0iobUQpBLJVxO1c+FrWlAJlR6CeGkGizWIBjul6KW9Y1H4IIgHUTJIC
 l91s+++Hlg/bMfDNkeyTU/ffzwha2wiKlxlRG6wDXTO3sEMmSC+ej6+Ln72MKe43ah71/nnwV2E
 7hpii+fgKTv6aFTXawYVHXXFgg5NpylYhwfbpcnyrubQvnS93sUStb/8A6rRVKo75jGX/5Ev9SS
 oMF07/BRZJQ7Q/EazpKOiY2dOypPavrcwJdZKV82X7EyIOIiES3PQ7Pw1mdD9vfQHrDTeq3pJb6
 /438Xm4my/L4H9DbkEwVpwN+trBsPMhb/Or6+r6Xq9mSkn7KCjcDCbVlF1xDWdqrbYYi9upfISn
 MOgGxPQXkhBaiwjpmKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270058

During PCIe recovery events, such as a fatal AER event or other
platform-specific PCIe failures, the controller may enter a state that
requires a full reset before normal link operation can be restored.

On firmware-managed PCIe controllers, Linux does not control the PHY,
clocks, resets, or LTSSM state directly. Instead, these resources are
managed by firmware through the power-domain framework.

Implement the reset_root_port() callback by performing a Runtime PM
power cycle of the controller. This allows firmware to reset and
reinitialize the hardware before bringing the controller back online.

Since controller state is lost across the power cycle, reinitialize the
DWC MSI configuration after resume.

The callback is only registered when CONFIG_PM_SLEEP is enabled, as the
required PM support is unavailable otherwise.

This enables Root Port reset and recovery support for firmware-managed
controllers.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d903f10211c2..fe86b8fbc895 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1855,6 +1855,35 @@ static int qcom_pcie_set_max_opp(struct device *dev)
 	return ret;
 }
 
+/*
+ * Reset for firmware-managed controllers: power-cycle via runtime PM and
+ * reprogram DWC MSI registers on resume.
+ */
+static int qcom_pcie_fw_reset_root_port(struct pci_host_bridge *bridge,
+					struct pci_dev *pdev)
+{
+	struct pci_config_window *cfg = bridge->sysdata;
+	struct device *dev = bridge->dev.parent;
+	struct dw_pcie_rp *pp = cfg->priv;
+	int ret;
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		dev_err(dev, "Failed to force runtime suspend for reset: %d\n", ret);
+		return ret;
+	}
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret) {
+		dev_err(dev, "Failed to force runtime resume after reset: %d\n", ret);
+		return ret;
+	}
+
+	dw_pcie_msi_init(pp);
+
+	return 0;
+}
+
 /*
  * Qcom PCIe controllers only support one Root Port per controller instance. So
  * this function ignores the 'pci_dev' associated with the Root Port and just
@@ -2031,6 +2060,8 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 
 	dw_pcie_msi_init(pp);
 
+	cfg->priv = pp;
+
 	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
 }
 
@@ -2292,6 +2323,8 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		bridge->sysdata = cfg;
 		bridge->ops = (struct pci_ops *)&pci_qcom_ecam_ops.pci_ops;
 		bridge->msi_domain = true;
+		if (IS_ENABLED(CONFIG_PM_SLEEP))
+			bridge->reset_root_port = qcom_pcie_fw_reset_root_port;
 
 		ret = pci_host_probe(bridge);
 		if (ret)

-- 
2.43.0

