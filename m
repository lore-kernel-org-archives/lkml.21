Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517620;
	b=xVVDRnH7+De4ZpzJ78P6cRofb3Py7t6h7tgBGUQX1Fbnrxg4WSaqCO9BfR9UoIPduZbB
	 VPGaCp9ne0UKB5tsKfcQZwdadQ1jocJslvQ9Fyy4h68+j6HflOxNePUPDtD4b2AmLLrvr
	 dXvGDCxZaF6jqbhJmVvFzjE1d7II08I0EuaVepJO9j4LtCwy+VFLZ3TvXLQeInh8fyw9i
	 NKa2jh9X66VMb0nAgpKoTy1D1EukBz6CUasdpDYWXhjx7TjfQvpS61E5Fl3H30FGXehs4
	 yqMlFMdbtp8yVxiqEpQHk30QW7eAnE2QBcYJwqS3Hh5faRIsOGturqbF9S3d8w+IM3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pOUUZx0CdtYKdqp1+EXJxk1WGWW/wxGKNatiFAzBlmg=;
	b=dBwa/ydSXuGdBrKSQia3KshrbQgdp8Az6hSwzhKQJZdNH9xBumWsIWx9N83eUeqob1Sc
	 VRN0D0dQNb7YkBSku1X19MhYButniPFGNvqzVbiD077V2vxF76hAY/F6RtI65M+o3dBja
	 FhQcqoePZ8X+eahCZd4gP1GKRtdpJ5RSrqGWqX1SNa5M5PyAU6lurYJSE0ZmGcVQvqEMx
	 5Ku2AcACbnX5GowqeWohBqyMZkQKaQpHi1DE9zamPS0jlDSjh0OWUqR2r+rHV8JrhcxlB
	 OPWae4I+ibVzWkw16tBXLIi/EbEirNrRpSb8UovgaJf0LvwfsaaehlukK8F77fsmdJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QAMMolDc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WsAb/cfV";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2F6606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A2F6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QAMMolDc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WsAb/cfV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8Z5lI3850977
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pOUUZx0CdtYKdqp1+EXJxk1WGWW/wxGKNat
	iFAzBlmg=; b=QAMMolDcSlBSXYPRXycbXn72xsh45SeMp9zkjEsf17Py/1b5jXX
	bZlNVlbeU1zTTQKX9qdxBpVczc6wxW7fCYwxq/X7PQ56Y/HFee7Tey+86owdoELK
	b9YrfvS3F+k2cTD1wPM2h3QI5O+CcW0hkfC89rVputG7U15mmO4hTJW7jc1kHARo
	cKdva5O1j8GbpipnYkVmYDtyaOPlWtG0rIY0Rr9wjvFIShQ2g4coqN1WRoPCCWd6
	jfP3uuWZ4xku48e9Ep9wpzzd/rq1osKwhm0OqP2SdtzHx5LExTgkvGDc8HZAMHIj
	6c1+IZ+ZBA2/q9t90/J3bEhkCKxaZnnENxA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb2aty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:53:38 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1af203073e0so4904201c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517617; x=1796122417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pOUUZx0CdtYKdqp1+EXJxk1WGWW/wxGKNatiFAzBlmg=;
        b=WsAb/cfVGGUCGnHNOF9xDMI34rlKwEiRNIyQPPP7S2bxTjxDQFjKRJvzeyYlfO6gGT
         CGOU73ieSRjf49oSgiJzslxpwdqSZ0vqEKBG71Zc8V9l0ny1Ojt1S4QnfsVpSUIGIpEm
         vCa16Q9xADqfvq9byxrgBTebhJt3evd7tGppNHU+aOORSmYPVxWqMe+sGCFVoZR2ldtn
         eZJpw97jodJbjNQrfPuMNf8N62HgW37dBl9T3Ebg/XFpzygfqRQHG7WQxatefvUYhB1e
         jIcdkN0Bic05KPJ7UVIdoMwZh3BWhy0w3KBbOSODRyaDaM1mAMaWgO4+e1ngZVVHUb27
         qN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517617; x=1796122417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOUUZx0CdtYKdqp1+EXJxk1WGWW/wxGKNatiFAzBlmg=;
        b=NQktnEIHP20YBc8VZLHMCCRYe4Iw8CAffeZIyqigrZW4UuFD2k/u01yNw2B3pVdcKn
         rJkvtEfIlc96FOfWUHS19Je2EGU6NeUiLBz2Q6bNC2bBkxjjwDW0FukvfdQ8jQTvyNct
         HW1xLQrhjjWT8vaXWJuXMmOYMuqWqpfkdGKGVfr+5FLaJwlVkxy7073pnulQAAxABlr9
         xdc5pNJxZe14wAzs6ztOgogjoD3Gs7nLs7k15pdX15VzE+2eSKOlDEZvq6iHEi1Sq6fc
         tWf8R0k2/VthvNP//5u8+q7gjk0OP0T/z43fwFtmVl30gAoyMytTVsfUMIpOWjBakG5P
         6wkg==
X-Forwarded-Encrypted: i=1; AL+hErFh8uo2Rff8+drMRSIj5puZqntJGjHbaxchAQKJYGNFTbtNqkayo5o7kAnY7I0FNRAXAyrRcE9SLWbdlgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sstxukaVSKxMsKW7su53Nw/5V/kP4d2kBT5ZXD8MHQwQ+MG9w
	S2j11swUwpfyU1dPXMXfXwKUipiXog8aCYZXm/jPZ2Ky5pJbh73Xse5MEftEPbFqsKZU/p16TuJ
	TstM3eQZ4itorT0MQy72HXCBHHgqJVA1YZzGMHMUZr2c2aNikG6/1YgpCzcBuJhN54fxappi3vL
	M=
X-Gm-Gg: AZFdTZcLN6sU6oDiwG5DvMIipaveZA3i+KT2Fyh1k3BC6RjT00QqPnCkMY53tqN47eS
	VYjfqKk5TfInXCRse2KE/xBwcqZ/4bPXgClt4jP8znX/Purv8xIHpR6AkaZ9iOj6VWAvVLPy3OG
	PGqhig8ukywQ4vfNGQaaOKma2eOEM3OiSpAERVobXMygxyFVAPs+5FFny0WKAnKv4aFC2Inr31M
	5vBAf5Pg310lJ8+EYhF4fxAso7cuPM0s2NW5h2FS3ITfe8NIGJBkFL6mR6ytU46uoh4bjVABJES
	glRL9eQWFZfhq5M8nc4wt+N/9cPuHdYWQBge26INgZHKMH/DPaZ2HGZqicdUGGKFf0Ts79iS5Wm
	gpSyplL6k/uWmYOR/ZiYz2lV/c4Ii5LmYYOQOYsh3FCrIk9mR9RsHe8aMOWjKa6k790rK+r5sWY
	rk5GghlhbcddS7bN6fZeH63W6axDT0xFNON4BPtR/L3xgECx20XlBOpF/o
X-Received: by 2002:a05:7022:ea8a:b0:1b5:3819:f8a with SMTP id a92af1059eb24-1b5569050demr14405124c88.38.1795517617299;
        Tue, 24 Nov 2026 02:53:37 -0800 (PST)
X-Received: by 2002:a05:7022:ea8a:b0:1b5:3819:f8a with SMTP id a92af1059eb24-1b5569050demr14405102c88.38.1795517616783;
        Tue, 24 Nov 2026 02:53:36 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm33732659c88.15.2026.11.24.02.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:36 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: Add Seca IPCC compatible
Date: Tue, 24 Nov 2026 16:23:20 +0530
Message-ID: <1a2010d7c4f4ae5d4629d2709157d7d47c20b3ea.1795517600.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b056cb2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: p1x3EPoILg-jsD7L8eBHJoEpbBII3wMI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX7SZaCcKbKqjy
 UQFvZQGSX4zjlkPq8g4M8CfMLgDTSJgLckKxTO/kNzWhFJG5qO/KPuO5zczkc9o+q1lcJpNLEhm
 OI3gt84iC7Nh+pPooiJNfgQyx3mv0TI=
X-Proofpoint-GUID: p1x3EPoILg-jsD7L8eBHJoEpbBII3wMI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXwFB2OpqPEOWL
 90Yg1uT6/U5f9I6XSBhkKu2X3wwZ6y0Uc2D1IfQYYTHJ0R4MO8VF8GdA+i5JOp+TdZrqj9DYaMx
 eQH/YXMsglZObyjYh5DPlj+BZECQleQgeurdRHOrM60GlOO3wZnJ1a4rMxjivRVK0ZmgXfWrmYm
 +MNwOdWhMpBxUMy3oVB70324rhzl+IUqpb66mNj8VUjSrNpJk33emPESyAFNjmWrg24ykFUchqS
 SNTZRi2A57jxwbUfdO0dUNTHkxXdFRT0dqRE6uH4n6iZqoYBgoTnU9hrtNdXqy1tFecS2qfv9bE
 odP7pVcEh6yqwdjQ/jJOH3h49/gLGdZkpR/YtD9nHwShayQyxCChKD8Xcg169FiLMZhMOi1IDOO
 4zZgEcszTktwzgP4nqa541J1bx63bVoxW4UVw6WA1LFpte09ZtTeST7Sm8Xl65eGcJsz9pCMB6n
 DJbNfvAlP9nuw5h6AXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,seca-ipcc compatible string for the Inter-Processor
Communication Controller in Qualcomm Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index a378fe8c7148..5734ac79024b 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,sc7280-ipcc
           - qcom,sc8280xp-ipcc
           - qcom,sdx75-ipcc
+          - qcom,seca-ipcc
           - qcom,sm6350-ipcc
           - qcom,sm6375-ipcc
           - qcom,sm8250-ipcc

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

