Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689737;
	b=BLhkFbQ01isEPq1bqTln8q7Nk/6ICu/9c6UtAs1VHH+tmC4el03w/D2b1hMQ0PBHIpYL
	 dvdQGc6dI+GDm+C+5NUz8boieAEa1W5XLrk326euX1P2NxV3Xk/kw+aLWiDO4LT3ocKJN
	 R3X33TS2fQu/U0Y/zGNmKknwG0tuV5CKOQgRhZQdphzhXdR1VQ9y3BCX2sKBByk4Y0zw+
	 xHh4sIG6ZB08aS+aRwxZcCMtPwCVSkAmq46xMNDxNmjMF/IjXIHPnIdK5W71J6VINBPZS
	 Le+FsF06EMqL61Dm3YhUPk6Fiky52MiT4w7eEYN07DzH6Ffmo0JAcvX0lvrTtxoHrBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rK88ANQnkQ8rdkZwBarjCwNhsJJa/5niquMyC5QOxa4=;
	b=GUZGmWaiJvNNeRbMqV9hf929Q7YIpIGk5BjiEJeAL0I9iULe6pWSZRDzVMdIQhNRgSar
	 JGHL1wfPWIP45n3IClY3ma4XAJfau1vH9qx/DUzOdg1Bq6CB9wzsWeP+o9mOxEfHieZk/
	 rInPYx/Z+jyzySS8A3Ro9q/HHDFrWFakjYFgeuT1klbYn8JBNoBGXGFBjmPvUEwIXWrQt
	 ssgykw6/3/zDMIY93KREZDCrm0x8cmp7743QuPXD8vyIOEp1g8i6BJdv0wdQegqvvCD9w
	 FCjGEZ0bb90zIDWbp+o3/E2wBoZcvbVW6f/78aXkc1lgp3PGDbU2ZH324+W7cx3d6hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7feRKvB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BaSOd5Fb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F24606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51F24606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7feRKvB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BaSOd5Fb
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXJGX3348423
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rK88ANQnkQ8
	rdkZwBarjCwNhsJJa/5niquMyC5QOxa4=; b=p7feRKvBULmbWWS9MQfITOY6d7f
	cDVD9DqDNyULB/L9w3ks2SNFR3nk+bnQQYOxrVzpO7FCg5ALpFpwMMMqJz152L5y
	ek5R2H/nkv+o0YPlBpMVeF7qoUd6ZUc0UUuuflzz0RGp80YNZKmgdPERzeSMiyq0
	+wIxDJsk9DGwD4Gk9HhRZHOpfkN3FqVa5/e3s5/6dvL0pPqbArZfJNjph18frC9B
	hJl9UwYhqbMp9FLJr3L2NvJCthDzmwv9UC38oiADkbA5IG7xtsPbKuB7mTPrYfhn
	5CAIbivibOb4y1p8bH8+9k17kn78mlvo/Qmfp0ltYeBGoBjl/z6SaSf4BXg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rh1na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:42:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so6993017eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795689736; x=1796294536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rK88ANQnkQ8rdkZwBarjCwNhsJJa/5niquMyC5QOxa4=;
        b=BaSOd5Fbw1JUgao7ky99iHh6j6oCzwk6pMDkVJz4RRStwGuJKDFnKdEC5WzFhO5jts
         Xb9iaunt7slkqllCC6rx5XcxsxGWfrUFLA57VgM8aO2ZWOfhEOSfSBIlEwmd3YCMSS21
         utOGdbk+ep3ZoS9PL8XA/+L3fXgF0CaXYfRghhjqJ+WH2rRiUM8lfNawNxQa4TUKdPmA
         YmEXApx6CH1DdNc1rtdUh/TAc8+jAYH14edxrf4lB9J5tSFIxM1xSeLsNqom62TLEFpS
         HuArsOLnNCAXPMFn3HnBmMjP4xNRNIOZ7gg9BdhSvdc8zEz89flBGdUx8ASxy7fZGSzA
         4pQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689736; x=1796294536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rK88ANQnkQ8rdkZwBarjCwNhsJJa/5niquMyC5QOxa4=;
        b=KLba2UW5jf/JpueCTYsADEp+dpCl9X6HYsxB+IXyhgX0gKWBydUsZlwcbdbS0/3drF
         33NEq7db7j/3hANbmtfD5xUkIe/r1kVQY4wLww/Wj4O374zVo2HcVWM93NRl+U++6tJW
         8j7zEh0NsToj+hHvY6dun4/2/fwg7ItwfVM1fnfY5NQuX+1BbG4kQV8AbkXjdLIIQenj
         unQkTVPqz7OAphSfJbWuOLZuS8oDsi8r+esXNjEB2fgDrOkH6yLHSNpJ8dIQ1nSKis0G
         NUn4D+5zJARxwcT2PyrcVV/apPlM4ltyB+/NuTFTcFqd13IjGyVryGhhptHdhqnvytvm
         bSuw==
X-Gm-Message-State: APuU4Z9+64UamM3uWqKCuFLciLfrhuo2nP49WLG6+DmtVF4mMStx1i/C
	/mqdoiDpMRI94L3tgfOmamKdR80UM/KoP4aUkZcn/vWdup8BUKc/dseTASD8+TQ0hveCUX8HWlw
	HQSqxtwQGj3Vz9r2av6PrClU8PQvBm80FI/VxVgIafVudiwzqpRB4h2bovwvKhrak0oI=
X-Gm-Gg: AZFdTZd+9yRexYlZwj0k/I5MmT1Ir/Vl1aFGSs2mHGrRwhiGf3m7R+EqxtzNLzNmucQ
	xokR/hsS4NW7w1PET+Fy2xFo1ClFVoutIJHeI6S3EJc0xyhSzixqd4PxF7HR0/ESsCy7m0jIxeQ
	AOES2/itNOgDqADClkRh9ZD/n/b3DCnNZtyJN7u9iTzkj2/gFnv9ZWkV4TPGdPe9s2wmxgWGlUM
	6doA3qpNw7dna3eGG3Tar06DqQcKo8U9qkRznxzdxVXD3Kyr2K32CUVjJu8BOvyPZ2I7FcFd00t
	w35GJmrnFvyYAqHTr7oaAliqZR8u6gUNDrs7usHtxjLu5Zq/9itrOVE7Blxn6i69buL3gomSYSn
	XmrJBa9XRA8MV5H+BfOUykAE+ePg8qEINY6dXC/6BuXx5nCXpEWhLPHTy0HrGUYVny5lThS/o2Q
	FB/A==
X-Received: by 2002:a05:7301:5098:b0:381:5fe2:a079 with SMTP id 5a478bee46e88-3856c6b010amr21103081eec.1.1795689735725;
        Thu, 26 Nov 2026 02:42:15 -0800 (PST)
X-Received: by 2002:a05:7301:5098:b0:381:5fe2:a079 with SMTP id 5a478bee46e88-3856c6b010amr21103057eec.1.1795689735187;
        Thu, 26 Nov 2026 02:42:15 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm55627947eec.20.2026.11.26.02.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:42:14 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 2/2] arm64: dts: qcom: shikra-iqs-evk: Add CC orientation-gpios for usb1 port
Date: Thu, 26 Nov 2026 16:12:01 +0530
Message-ID: <20261126104201.1613183-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126104201.1613183-1-akash.kumar@oss.qualcomm.com>
References: <20261126104201.1613183-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXwHZoyGnGAPpw
 iU3oxcLBwdK4G8noTrIdwlDsq4UcpoufhEgyEgo8Hlz53OmlbhofXIy3L3nGWICk76qoAb9wzpH
 LmJk+jkulTn4EjY9y7Jd80g4itzEm21FKLfFw26Q/PpUH0sqLBLXdBcAD5/pIw/NuGCHbZCOyXJ
 uP9zNB2oc2GqBrxLlJuNgUhV0BQwIGEM+Vfs2pRk2NiCk7lQL5kNXMpD75hwKmzUHVAFaGQxqeq
 fGC+F8fS5/JFSE6IWkpj7Wp8KoDGRtiFUTHssQT6RyR8UAagmEnQYDx4b5n5W1J/AA1sOTLAPQp
 nII2hmwO7CNyLqx/8+4dioaOXD9FB3AzrgGor9HgVgIs/jCVkICduABMxDr7QomZa9y2+SSy4J6
 ogMY+Da5GW4zFl+V10UWWQEw3q2UPHRRvTDNCCjC9IeO8tvhtTKxQ7FUgpZRhHZsM3nUlZPpBn9
 mgGIDV5NIjNzHoasqWA==
X-Proofpoint-GUID: la8XE--TcZWiwX5q1vfyaKVR6redo3GE
X-Proofpoint-ORIG-GUID: la8XE--TcZWiwX5q1vfyaKVR6redo3GE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX3x/NbUKMAbVF
 IAiIsbRDkzYO57OUB1HlejL5JuK3CnutWj9AKkSUtHE6dTY97D2jG9WC15sD1iNtkKiNqCQrNgY
 /oXtqSHfYFNUKUNWfDFhBUea4tRLL5c=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b080d08 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KsdAzPQAT_6ys4-rp0cA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The CYPD6229 PD controller has no HPI register exposing CC polarity,
so the usb1 (usb_1/QMP-SS-connected) Type-C port on IQS has no way to
report orientation through typec_set_orientation() from UCSI status
alone. Since this is the SuperSpeed-capable port, correct orientation
reporting matters for lane polarity, so IQS wires a board-level
CC-sense line for it to TLMM GPIO90.

CQM and CQS get CC orientation from their TPMS instead, so they don't
need this property.

Add orientation-gpios to the typec@40 node, using the ucsi_ccg
CC-orientation-sensing support added by:
https://lore.kernel.org/all/20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com/

typec@40 has two connectors on IQS; the orientation-gpios list is
ordered by connector reg, so the entry for connector@0 (usb0,
HS-only) is left as <0> since that port has no sense line wired.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 0e770dafa9d9..fc0bdb20c7a9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -46,6 +46,7 @@ typec@40 {
 		pinctrl-0 = <&usb0_intr_state>;
 		pinctrl-names = "default";
 		wakeup-source;
+		orientation-gpios = <0>, <&tlmm 90 GPIO_ACTIVE_HIGH>;
 
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.43.0

