Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093056;
	b=bwdud37z1x3PW5U88kQ5F4EJGvWc1xhtJpVhyyOlP8SBujZWqlUevC5JIcidjbjUdvw8
	 g9oA6eie1vbjnpJQOxvx6zph/Tq2NU7dRx88yzwg/tAsHmRK12FKMSRUD3vKHv1E3xo1e
	 wY730IWCAKz2Qd0QET8UIERtOpSu1aIuN1l5wnSoM84ogukNlGNld27gl7zpvpO8sKcrs
	 3EXQn/lPpif9A8IXy5ZXLasnph9BUbeoldKa+4i9I5MLCqhoE6t7o7FVsweBFnGpKBZJR
	 Tk+UVy5i8xbRomMTTuN2LFyxRFTMmAFd8befwFVBGh8GBFVCUJxRrbJnNHxH8Q0WQUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093056;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=;
	b=ZzsFMS9u7LVTMCKPNIJJbfmXC8mVfzyJXqqc04M4NREC45A7yv3nytd2jujCe+N8zyv0
	 Sy2NK2pacLm1wFpAXgaBX6BALCJT/vY3Htrl6jenIhCl/NtH2ZIenQIchrS3o/Le/mScf
	 K1H6GO8cWN85kIEhbbJj0iP5g6UKBJNyPxNtsl3cnZp3VRdDRxtgczGxSYjmFtS18goWT
	 3coErru7n3LFVREAKkDfmNN/AiVcIO+o3hc9lePOWWK3ma33jv8R02BzD8mAXE1TZPXDo
	 dPX3t7DmHPZjSIk0Mr7BdY4+TwqLWah+MtXrS8pn4Gj9wPpgz8+Pr3rL7vYzKz7hzqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fnOJOxjc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXjBDK6h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34A060A2618
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F34A060A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fnOJOxjc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXjBDK6h
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBkjOj2685324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=; b=fnOJOxjcVJhPPc8X
	Tq1g+pIsA0wtmc0yQZgp+hJyTnaAjcvMFOlPWCQmFNS+YvR1W4YMTSSEdKAOjwF5
	vY1dJAWVXzi8WMUovDx3M13R9Xlc6+sUm1eKZYq4NjV0QKGWS0t6uhhZNMi7HXxS
	MecjPt1HkZbkTiJo0JG3sUv5Lxikt8M9mpu+p/KsDr2aKqZLl4wmpKA+Qqd1OzwE
	Sb9DJ0l4qQhtOzLWmOE3KIQs+7daAohIPeiE4nGyPLYImaFfquMhinR8q7JAgQI7
	0H0F+6wYjCna5DBYU+vGbaeNyHtTlrye4ngFKyr16yKtn1Pe7k9pJeEp5m5C1XVK
	EtfqWg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j20gu87vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:57:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so3235875eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093054; x=1795697854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=;
        b=AXjBDK6hTUvghTEEQGJrAsk4s/imfT2vW562lvKKx+O4cdcjCiOnxpoPTv56fCjDNE
         9EbdqcXrz15uT1PWRAIjXT8xPKjCvQyc7D9mL/gi69zVJwFrwqunkzagTKDvxAT1OQQg
         f0mCSxWADBMzBiXJmuX7GNgAlNBvblCCr2/yrRo5HLNSnIx6Jw+Fl1DCLKuXl1v0rFzh
         DLO3CiQCsGuLq5sR+nm8hxPLsfnSFx0hNtkpCjW6t1z4ZZL3onziJh8c2qExyB9odiL1
         ftpTMv2EaCKIrU02guKcP0NAdeHH+YWFMgrp4Cn+dhqRlYWctoVXaNq4EdOZ8uqcO40e
         BDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093054; x=1795697854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=;
        b=z4Ax2FIlBh5a7pTbTu9Pn+6l85YuV98mfIFJKcSf+h5SlUrMsyccj0qicAMUvAnhPr
         K0O7q/mve8qews7ThB6E2wsrwOqoLUz6PJ8nyBdncO2PzayBuRIXiAg0P+poTo8J5YHI
         +W3KaJfYYoBf9DGehtF7nBB2vDHpGuxx62UR4JWTJdWP2V4nTyN45+VqcQryU2/LpRsM
         Qq5xbc8oL6uxX7BXNNn4shEL78EKNgUfVxisSMdycSgfCtZzllkdTq5100yxn72a7F/J
         4O5xKGffuVh0Py0BHdkNKtOFPvV/mRgmKB/spfm17foHEjhihd0p/L8Y9hW7LF0hJM7j
         TEYg==
X-Forwarded-Encrypted: i=1; AL+hErHHbp5AAAr5GDsIh8WmFsKguHgtxB1krykDZWlTNfnf10Kq3r65zAzQ2fuUJeMazmU2gX12gy6HjmvGlZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CitCJpOFjHPnDCHAzzMBH4XQFUVFVBkvR0UtpOPgag7cLKe5A
	9OuF82QOTZLZj5xZMi/0wlJGgYQImwskVaF0CDMmHYJ5ZF70lAJiDCn6oGxMXtdRxI6Pjs945ct
	OJ7njR5E6vvvYOqEgSxERdD9IWEttDuIbjklyK9Icubnpogl988HjSMXqNkXA/XYspSo=
X-Gm-Gg: AZFdTZdhZDOo1JB4bXpMc3qsuAla7IjXIPm8ilg6N9NGCAJLVq134pBdjXjf3ou9Q95
	y/b20tOM5Dp8VrqXSnKnyiR+vQuKMWVG0zJZoD5bH1YnjyQlKVKEAsGgdvuj6obP8eL47piaRX5
	oSEyCD5KApncBGZ5KVD2Hp2GgtzVa84jnlU8uzvKN1UyvF1+PqgVZwCnKQhSf/RkipVAFN2SwcO
	Tb+qUku2aIhfl2ZKIa9sI3ZmFuP2ZKfHJzHpKjaFWm4yUxi9prmE0SVGnw9RCCVURpp92vWB4Y2
	/+Hinw1nTi6Z8AlXYS/ZhV3ulxLdYAWu/7d8nNH4oUPvb6CEZ38LbEQEMpmjrYJRPWyLQcGAm+I
	TIGGy7B9p2SIAvYiuVvy9EQsWYtJN8nh9VtqcBSEhDegTj7ahtTdU7wHqYD7RTM1AeGBjZFxrzW
	Agvy9CQykj
X-Received: by 2002:a05:7301:1502:b0:36e:a321:5353 with SMTP id 5a478bee46e88-3827dd05625mr4987998eec.2.1795093053899;
        Thu, 19 Nov 2026 04:57:33 -0800 (PST)
X-Received: by 2002:a05:7301:1502:b0:36e:a321:5353 with SMTP id 5a478bee46e88-3827dd05625mr4987957eec.2.1795093053264;
        Thu, 19 Nov 2026 04:57:33 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:39 +0530
Subject: [PATCH v6 7/7] PCI: qcom: Enable ASPM disabling during link
 retraining
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
Message-Id: <20261119-bwscale-v6-7-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=1086;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=dixWhgN1FcwflBXIi0Se/61aBMCRn0NVL4pFbQ5pD1M=;
 b=PUZk3GeenFpAL675pkSjVwlCW6zpIzwS6Gmvb7s0aa9docOEiXMtvktcnV9mru6evKsNiDilX
 wUhqKH8Hy86C6QnFabVSxqG6C4LbGY+SWRnz4vitzqM5gfjezA/UxS4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfXw2LykYfSA7SZ
 2vlFEc8RHedcaib/4v3FRGyY95cM32LL4+hc8FIVJdISmi8YgO4bZg94fAtIWoLLFsQWSr5AgeW
 KKV9AOYTzNZXqPnRGFDJey8VE3Pty5k=
X-Proofpoint-ORIG-GUID: Y4DiKxBG8HLI4OqDQY1EFjBGAk9DBX6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX3/y90zDEIN8v
 Aake3Lu1NxaV0tznFmpcfwmfbMPIJH83ud/oxQiPxSAsNAfoceQrtH5gA7VkpSFzSsEEml9gdS+
 Ug+JqitcQFg4jydscV+uqyWcdFIgPj7ZzcSSUXFigZlnNniW3Rcw4gAJtXrpzyJZfQgyO9sPEYY
 JRWvYXuunAAwLEYHAlWzZjt7ddUoTTAgtD7NB4z4tNi3A+XHds0Qcvgv2+oDUAWDSSaPXvf/wEB
 jjQHhqm6AHiwutMj0prEsxTO6iNZ+aXoah/V8PDV4qGn3ICR4et5Ed5XnTM2TjTZADiVPA0vQQr
 ESKCZg7lZMGTnz+GRuIY5G0M5AiR1Biv1C35VGwxm0juT+o58DXPiwmLtwU4V5zSGWzA2XKNl+K
 U+ZCg9ycZCVsXW0TYw1/EYLSSni9Uou0wm0srqzS2FY8Nv7tbIwYjmAe0Rwqmc9ZZqj7VXVsk5r
 D5LbpCSGlSaAEzi5VmA==
X-Proofpoint-GUID: Y4DiKxBG8HLI4OqDQY1EFjBGAk9DBX6u
X-Authority-Analysis: v=2.4 cv=XutvqlF9 c=1 sm=1 tr=0 ts=6afef23e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=R7JsESPv6PNixK4vMH8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051

Some Qualcomm PCIe controllers require ASPM to be disabled while the link
is being retrained, otherwise the link state transitions during bandwidth
scaling can fail. This is a controller requirement, not a device quirk.

Set the disable_aspm_for_retrain flag in qcom_pcie_host_init() so that
the PCI core disables ASPM around link retraining. Future targets fix
this in hardware and will not set the flag.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 9b113536a82b..473f2fce258a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1514,6 +1514,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 
 	qcom_pcie_perst_deassert(pcie);
 
+	pp->bridge->disable_aspm_for_retrain = true;
+
 	if (pcie->cfg->ops->config_sid) {
 		ret = pcie->cfg->ops->config_sid(pcie);
 		if (ret)

-- 
2.34.1

