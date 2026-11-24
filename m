Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521385;
	b=zMknNEclftGyYTnc4bAh5rUGaSq2hCCxAeFDg4NtNkfIO433Fk/ccpOkJo2T9lNOpRbJ
	 tyEGIlO6Yg5h9SuPlr9b7iutp80N/d4YlXV4h7gK0i3t9YfHGbu8Iq5OZaxeu7i7PN5ce
	 0nYbzM9vMylFgz0Gvw2qKhnm9FiieK6QeFs8gm6b2nUKfXNtemYAsejtFkQIJcXlqgHGk
	 bbGk2IrczgVfy8SKRAOU0kVhVFjYlrnjwZJnvxdrk0AHTBUWI1chvtHvuwkM82ZFUqgS+
	 MCDjONiBd1NIPXBQ3b3IUKxLG8nemp1Z311n7tM8MCe9OHdgVzVVlaq0XiXjufBUoKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qiJdwOJzBM6Kd1w598aMZRytqMeSnmHW/XmVJ2AjRfc=;
	b=gCOHeXe33vxfiEkC5/oTLWdyjx244ffNbSWAIBa2azhFaQUzhEmPRaIi4upO8dhiF9c6
	 spRMCr1yWyI0xiG5dlw+3Z3dGDhwctixtvpmLJNNZ0W9po27to8RXjxHPeAaPvqgX3yuN
	 XAeGwN1KMRq92XgkPkLMLBpcFc5TmUpDEUKR+U3wIR5ooORyCV9E8Sb4P5tdIkqIA6lU4
	 fAuwJjBcixbWwNy0JKvFxh4UMMKDlNx/3+irBCS6WwV/yDDPSglShGb2uxGou2QAMX7b/
	 C+3yXIYwjdj1EkVUUvdaRKtRvE009BTK0dhDInX0aEo+Pky2/hfGApF7EVB6Yr/rFsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Nxx//tJE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHUiewJC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3430E606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3430E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nxx//tJE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHUiewJC
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuqUW1113723
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qiJdwOJzBM6Kd1w598aMZRyt
	qMeSnmHW/XmVJ2AjRfc=; b=Nxx//tJEuRhKaWvnXEsr7ScrUeXod/e92f006Vut
	R2NVMCBIkodXOR2yMuJEPkDFPq2TLnLhFqon+sCO+BQR6PwCPXSbZcWL0b1ANd1d
	J7EkB7at4972z4M8cdKaU6D0Ci5hxBgvVWKcIjEQR2Bt39P8xZUX08SvNdDn/ItF
	r1frv/UOGmmi/J0MNVn7xt/4/ccr3KWbpC+tlnDl8lZn3Y4CDNI13QAjiSXvr34B
	aMDLTcSOJ2OCx54rV/QWSWs3OionBPeT4ihyCddbXKzwNklyLjVUU1wulBePn0oG
	w9KRhA/TWy1Q86pRRZrlnL+rV4hi9rkkJsNrZf/8+7u47w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nunrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:56:23 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso4637533c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795521383; x=1796126183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qiJdwOJzBM6Kd1w598aMZRytqMeSnmHW/XmVJ2AjRfc=;
        b=jHUiewJCLezAMwgz7kRicDKbISqfg1rtZzbj5O7WfMq5pgUtVyzgBIAQd7G4ZZtYe/
         HTdPxnzujwqjNsOr4gh5/SfnoGbKqe9cewmCjHvcVr0P3YNH1NUVDwIEbLwp+u+8TTSM
         Ch5Rhy+Ctr3UqiTRc60JbLozMrUkG47GdsChTBHKuuGj+WmArJK51cQQoznVxRRuX/eR
         +TQp5qRERlQSKxcUCG5VKRPMcDI7MIgtwz441wpiyJBQJ/BTCSTinLRFjyynLVZkaTqJ
         sdHbizXcAnfPaIPGSPVaj47iNPq58HBB5TesJov50OxZe30hbJDBAABLfYb0db7e3+ks
         GgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521383; x=1796126183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiJdwOJzBM6Kd1w598aMZRytqMeSnmHW/XmVJ2AjRfc=;
        b=TfsUXOaz8sxhAeZHhN2uw6PszbLBbfORSvJvyCx38+kQyya4SqxXXUOsPI7CEAMou1
         VXAr0lWqM2/ztFuH1bkI0Mnimm1V3pF508WdeIKhePpXoPppUazyVkw0ICjt7MpHOzJL
         VLqZUNDoYKUrdhBSXiF8vYi6QDjZEiH7cklK0TXY+ZaNgTP6CLXI8ZRlIsOufpKOW0wm
         7GEVmjYj2pFwgewfzlCr8D+b1KckxAq4Po/9tLpezxYtg0VCKDYjkdiX/HCX5cEI+1Dl
         6Id5xK6zZP8UD+K1oBwQ06d6oL6UYC6UZL41cNX3r+NzNq9oTw6tJJoI8IDJyrTZmeQG
         pScg==
X-Forwarded-Encrypted: i=1; AL+hErHNL412SPriCQxZurRBtG1TORZ39At0pd+dQWiPV4AqiYiAFNFAegwJzzufraqjtMSFHTEY417ZVyYnmVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z85CSLz3vPbk4k4vcUWLZoFOgwYSrkVpNLnASy6yTW54EBDVn50
	tw1tJRKGN5v2gkZU2p094cK39H0HabMMS7HhgEWkVGzvdDce+rzg1SI8yFwgY46GHpWovIr/YMS
	cCUv+u0MBMkNw/H9fjKaJxifNLiAXLwEZzSC8k2Lsc3h6qDlPweoBY6JFGM3fa0yvxRI=
X-Gm-Gg: AZFdTZdPkog+0YBt1CD+cA/FGNUp2w8IivE2+Azcsf+ZJoBgTCrEhy3lYIKQkNIqN/h
	9fBN9LsTAogug8SQcKz5H2SNHLkr9/F0dkcu/IUQSlBH683b5aDOhph4pzy97qVyLGyev5OBZnE
	fv7qI4jpjtUhZgLTG/Dm/iPKun0o+gtDD9tBOE+owt1yjVrPsLMf0rEy8Y/DUCE9NnolTqqpCp7
	vyzD4WKRpp8DKkk1dOk2pjDgHmmtGUBwpbEe2J8ZI3zcZKHMPkrhzRef5Ycn2Z9+H/K6/PVEX0y
	4SQjxU1XJgbuctErWUGLyhul8fdMASct17TFntMaKHvQtwsdTuEbSsB7R3f1zfZ/IALflbaySb7
	ZCPkZVq6LvV4Dldy4OiwJsdNe2KpeT/2fhxRC4hUfBvpqELS71TNYUUTF7QrxUJTPQZ7bFzvXHh
	c7
X-Received: by 2002:a05:701b:4591:10b0:143:297c:276c with SMTP id a92af1059eb24-1b55691aac2mr12967272c88.33.1795521382754;
        Tue, 24 Nov 2026 03:56:22 -0800 (PST)
X-Received: by 2002:a05:701b:4591:10b0:143:297c:276c with SMTP id a92af1059eb24-1b55691aac2mr12967252c88.33.1795521382015;
        Tue, 24 Nov 2026 03:56:22 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm35145257c88.10.2026.11.24.03.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:56:21 -0800 (PST)
Date: Tue, 24 Nov 2026 17:26:14 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Yadu M G <yadu.mg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: qcom: Add Seca TLMM support
Message-ID: <20261124115614.cqzo6ilr2shmzrxa@hu-mojha-hyd.qualcomm.com>
References: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NiBTYWx0ZWRfX+ktCngUaffex
 MdNg/U08ChGYv5/KE92MoHXI6WpNfa1ONVwhmmsJj/ERTSjZjVTgejCdUvzcIAFmQbpymZbQWgO
 WhsqMnwdlkfDJIbObSTiwS38L9Tt3u8EsE6kcC+zMj20wfI4F6P9VVRcxD6dIaIuNbGhXXufNZo
 3lj6d/ai7S6fGg9hOMgbZjWDY7+NU0Q/5nuUjTk7PdjR7enEy5rOjKZwPxVpFuv+gaiZWm41sS7
 nriwqedWpQflDYrS32SMzksqNIz8tdIGu+LOpZaiKiBVRBy+Gjl7wqVX2QHyAVioJZdg+r84lk7
 ChW8Z7I4ISz7fWYegrbug2Jwq0r60Op9shnlitMiKf3qtd9/1X8ZoPXEYpXS9zVnNtWSvwHlMj8
 Vgcex+XKzA1nDUKctEQQtVyOtyaNAvBbRwQ8NropWzhq3bAZazUTBh9mbX043An4+Rm3uSlKUGr
 xt96iO9Uqner4+cxbnA==
X-Proofpoint-GUID: 7VEyYpW_lCA5ieDCRoHH4UdlBSDi3Nqk
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b057b67 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6J28aJzw-_SWfeiIoy8A:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: 7VEyYpW_lCA5ieDCRoHH4UdlBSDi3Nqk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NiBTYWx0ZWRfXwZFf2PfufYyf
 Yq6M2qRYP1SjoANdK+EIqY8GQBhVmUws+3tqoIGdz2cef+zjS2UD3l9EWnNKu0Sp6Uwv2Np8oS0
 q3/GPV9rUTzDkxdDh7VRYcOEJVtm0ww=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240046

On Tue, Nov 24, 2026 at 04:23:01PM +0530, Yadu M G wrote:
> Add the TLMM pin controller binding and driver for the Qualcomm Seca
> automotive SoC.

Where is the introduction of Seca ? what is  Seca..?

> 
> This series was prepared with help from an AI coding assistant
> (Claude). It assisted with review on the device tree, bindings and
> driver (formatting and alignment fixes), rewording commit messages,
> and running the validation steps (checkpatch, dt_binding_check,
> dtbs_check and W=1 builds). All changes were reviewed and tested on the
> Seca Ride board.
> 
> Yadu M G (2):
>   dt-bindings: pinctrl: qcom: Add Seca TLMM bindings
>   pinctrl: qcom: Add seca pinctrl driver
> 
>  .../bindings/pinctrl/qcom,seca-tlmm.yaml      |  135 ++
>  drivers/pinctrl/qcom/Kconfig.msm              |   11 +
>  drivers/pinctrl/qcom/Makefile                 |    1 +
>  drivers/pinctrl/qcom/pinctrl-seca.c           | 1705 +++++++++++++++++
>  4 files changed, 1852 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-seca.c
> 
> 
> base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
> -- 
> 2.43.0
> 

-- 
-Mukesh Ojha
