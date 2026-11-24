Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542428;
	b=N2+fWUdSaJf99Ti0Epw2o/BvoicFgR/SCGh0uTMIVATIH/abeNWh8AZ7EWsfIbapX0Xq
	 PNfw4tCX2lDNnUDYAUWTep6FMc6fwdY3gdNG1nwL7gfoq4E3eJKrCCQ6TZiE1zBV/QSuZ
	 kbwmBMCj5Pd0Idc1tT+SywXY+3W7cd/LVxbTpbIGLRYP/oHvjiqwl9sypjcA1sT47l+hj
	 DGOVtlLlU7zyep9jMGXeU1oXP4MPvxZZdvUx5PGIYygUEnV5VWWVojdfGrnX8L62DK74F
	 pclKnx6ft4WkOzk5qUlEbolAYEIIuwSWsz1L3A/4QPwwsOXZVxeITqJFdF+NItHWU5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lcXA9xwayA+a+PdDfHhtNaUHIDytugzKoBG6+yD41s0=;
	b=2KFuHlYZD/NWdlzFnO49fxJg3kAWNG4OOXbriA9HD8Dx4YFTKXpJU+Tp6tKWlDHGTdNK
	 ABBRGzzz0EIrdYKBLMElYo8UByDGQKX5ytAty/bijDpiQOfrGxqHFUx+BV+W3v62MoUpd
	 GaZ/QjaKSKWiK5D3t2D6CCa3UHFI96C7/7WtOEfMj8dsI1DKzB+07iwAYTBP0cVGF4ExX
	 EqXCJ3Os0m+tlDJdFHaICEPYrnOmYZiAGt2AbVU3DCz+1/GEAwjXdwrz5T6PDelmm7oEa
	 tAdukRWIiFdURiCJz7S9mfNbUsn0saIYPiclpyq+ikTUId2m4KYASPYetK0jiAYo/xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UINICc8M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6eVoHYK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D46606A339
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D46606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UINICc8M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6eVoHYK
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL2UI1183782
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lcXA9xwayA+a+PdDfHhtNaUHIDytugzKoBG6+yD41s0=; b=UINICc8MB9+vIMQd
	lVKCF/c3qjM6TUI0tUcjZM2g+4tG4ePuaCffiUwd2w5fTukvnHCVWRY1XFRbl5Lw
	vYZvYxZYiXt7dlqRm2e6CdYi2wIHufYdsw08oArIU30+hnKspDTxaizR5RlmX/CA
	cIw3yVhJ9rOCesYjPj+GaIzSlVx0UVyMB4Mp/bIWXkRDxzvUV4Quds+oGHBEGNt2
	uIeWHm6EJPRH2oBdp+dE4HCoR9YUx8naV/ckVSBSoEB0a1h395ek5MdKUlMCf5KM
	D9KLSXGDCl/E9ckaKNttzCuMk2gNTbVn4/f2cqzTnH5hYTY2aJDIN2uNETKH8+1M
	Ag5E0g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky42gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:47:07 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso1847344e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542426; x=1796147226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcXA9xwayA+a+PdDfHhtNaUHIDytugzKoBG6+yD41s0=;
        b=X6eVoHYKuV87L/VEe/nc6LMahe7Lp7iJyvY0RPGFOxygAHNL46+/SEt34YtRGWbXMz
         Lbx/Gpf8UEc9PIjg6LAuSmXEZSu/MkCgE9woGjiEBIxYcfrLlnMZ8ZwEhi5pRBIJCWZI
         XqsrXKiOneu9cOBy/v1xj/o5nFCPetJvsaMOPVko+BxrxpRGq4dnPymNkfDshYKJDS/3
         VjczXaGQ4r82NEnzIaPjUsqhJCiTWhrZHZnCnIBv0fReXYc1xxvrkRycWjyahnboPZQy
         seELReES/qriOdH3zTw+MKYe3GapfNKzrP5bGy1d+bIehTEYRd1wAE3kKw4VSyEi0clb
         BBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542426; x=1796147226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcXA9xwayA+a+PdDfHhtNaUHIDytugzKoBG6+yD41s0=;
        b=KxJYLa8yniUWOv+xeAPbNE7GG0fyV7UXv2h2NSUaPxwyuHa8FtYr9GkB45gJyoD0zI
         BBOB8OdwBpQWh/8waZ2ZjsWNrX7dgpP5TFrZlpv6G4gNNTvlvrWfyRW/6AR5GEBYTgGw
         KPwi+43+r+O9gk7uhEH6RdpuZlMcG4n50zsRRLgZU+oc1oktE841iP67h5E6J1BqP6y+
         kd9KUQ5HW9l3wesH/gYdvFcAId2KZC3yDQTjIkUPnt4zM5QhuEyX+nI2QKgMZ4rcj1Vd
         TZbID7t5IkhnhOh5mbj5Tl2LxmJWxTenAfXpDdK9ecJwnu8dLP2JHOUuoG5K9cwWioHM
         ZRNA==
X-Forwarded-Encrypted: i=1; AL+hErENsOMd+O5R6EVYcOWLe8p8qfmZEkg1lb0TkgvGTtKDHMXgBJ8wfKxWUwRC02WnWBu79UbUTRIV6UJ074M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ra19unWXlINsgyGcT7HGTX4nt8m9d5DqiWg9JkAl2cPCw04BG
	C0ixDSceQNk/xKTnZhSlcP2N929+ZaLDxZ6qAcz6EhQsk9dU5e+nrPiWuWsQoWO0w9mMgJfFUzR
	y21Rj4mc8AbOvLqqqR96fK4B0MQrBnYJgWc6hCQ8GMiR9UdDMszcdPTwfTmnCYTKsZlA=
X-Gm-Gg: AZFdTZdbFWuaqoq45UMRR2CWKKTbwAR8N4Wiaia9DVEoA1jhBFX+pQrfZrmWUXZR1c5
	bphsKemomGqPTv3wbBQAIrUC5i6P5nHvFCPB9Z6yrhiefINilftkOmO6QtJNu8656hEXCavUFAj
	Ow64FqJhn7z1pw/JMPemJsgZmTr7bM7CSTEpG+8paVaOA5yH6pQpqeRoFEGTo6A4FOQN62Wh934
	YWJAYI8TD6u2sclr0bLmhJuzMLRx4k0CzP5JRnoUgVRl2oc+wndpO9eG8tmb4XFudwkx/Hm2Dvi
	pJzCYPg27sMj4AOZFvcHkJ8vQnCzSfaSas1JLQqfT6nhmBNg6T8n1GW3bQ+eUOQyHREio+kJjGO
	l4rTkXYAJ9z4FTvKTQJ4ED5sxUJuX9JvlrykhM5NwwZf2PhWOEtlLyB5Qi1aNLtGPtvOwfUWsMq
	UHb53WZJORbm4b
X-Received: by 2002:a05:6122:1352:b0:5ea:d1c4:7cbe with SMTP id 71dfb90a1353d-5ee8af79c4emr7196737e0c.23.1795542425880;
        Tue, 24 Nov 2026 09:47:05 -0800 (PST)
X-Received: by 2002:a05:6122:1352:b0:5ea:d1c4:7cbe with SMTP id 71dfb90a1353d-5ee8af79c4emr7196706e0c.23.1795542425373;
        Tue, 24 Nov 2026 09:47:05 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm7396418a12.20.2026.11.24.09.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:47:04 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:46:50 +0100
Subject: [PATCH v3 1/2] usb: misc: qcom_eud: clear the enabled state on
 disable
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
Message-Id: <20261124-qcm2290-eud-v3-1-4f31aef8c1c3@oss.qualcomm.com>
References: <20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com>
In-Reply-To: <20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05cd9b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-IlMunDoKa5HfhwsZc4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: _1vqnYkyxFN1pof8lAaTc461JvV4bCoi
X-Proofpoint-ORIG-GUID: _1vqnYkyxFN1pof8lAaTc461JvV4bCoi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX9kwC806DZXsQ
 M7R9BiGJaLP/fWL0rXbrx+45wwy8cbw7fRx+Nnk8esFj2Z88g5Bq41tjizeMPDbb5uyKmX0URIY
 HlBsUHXdKP3YI45UMu8E+o5Z2pW61As=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX5qkZwExhrtPu
 IDBAlwbEyhITQJMa0U7SA80zW4nx+606WYmKwPMHs3ZVByM06DRrK3EJKB58YujHlEAsA98lzCU
 95HFkl67GruDsY/Gir9Ixv6JBYOOayKLLM/El86DyPmQi75O6jRRimsnCjXCIEHeMOSRTGFDEl2
 poRwA7h4tXUVYPEb6m3qWRMNDq1+8It4BGRHRc349iXLUPmFVsEFYnBKlb8pNKGK0h4TTtmqMRm
 zTSulTNhOp7+MhFl5SUNTqRP/eIOsz9vG6A3siMdt7zoM0pfCYshegj6qYkgIr+bZCGXvlmegxW
 vN8mVBm/EevYRvCLOWYyle/1+mepAQtflqV6OI32dKKlX2aZu6jSS9z4CGX5TDKMg9PoETE6yjg
 SmG0PSy7T8t9QvElCphjZaub6YE11ZdcbyFhBflHK0TzPBBPC6ifhRGm3kN+dD76e+5XgsSMdfg
 dcXzafyDLWr19JgjpKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240069

enable_store() sets chip->enabled when the EUD is enabled but never
clears it. After a disable the "enable" attribute keeps reading 1, and
eud_remove() disables the EUD once more.

Clear it when disable_eud() succeeds.

Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 73f9fac22e19..6743a1c7d717 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -97,6 +97,8 @@ static ssize_t enable_store(struct device *dev,
 
 	} else {
 		ret = disable_eud(chip);
+		if (!ret)
+			chip->enabled = false;
 	}
 
 	return ret < 0 ? ret : count;

-- 
2.53.0

