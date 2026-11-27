Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772531;
	b=EDEtz+5anbmfWmfY/N4lJmAFMifMCH9IxdffeIVYkvjz0qkXi8q96D7VX13ZUOrg3jGD
	 Nhz/sYMJ/o8/UTUnblH1tMX9QeCz9o9EQjMZBD8HC5MWdMaRPgHFpbaMSiZqRjgcPlLZI
	 q5HF/tj6ZWFk9yOPRS7aUawUf0VNsk6JRk+cM9xenLujrFQoboi8eCSxTkzdXimYsc003
	 H5cGUr2aANiKvhoERhkWFKluI9NIQ1YsMdwcVeheNcsWq5X8rwrL4IGJ4i5n73Nk0Ronm
	 erxCMsyeDWhe9fVP1L6yXEbky9DDuo5tgEQX3nN59B9NZ9IKu7h7+9n4sd+1UvL2N0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ao7/wXB+3/09MsyV9yOdjkCOUMTfKupyz+iVks+8Wfc=;
	b=R12j36hLoLTj3mIXbaj3Ba+ZiKAh608r26wsR0M462+wwchsi/2nmUYkAGpK04D3hu+p
	 VCYulX5c8Mp2EMgM2USJHOo2LY+OBbnkNunmr5NHY1oNVdiHxJols7YVW2Q5NMDrLm750
	 /uoTIKgPty5+6tudLpDUSF2xK2HfxTrkzTzxbBKNqCBaKR04DadYhoyO2IlRFsVNdqpZl
	 dtl5OYAXCbSngFNdYaUds3xX6gFKwEz/EveB8RAaWDnVgkaDhz0qKrRrvULTpsAQgk4Uw
	 A4K168Y81WRvEH9xljlJaSNtHMrJyLg5Ii9V7dWS5OgMc91bTPsE0Wc136UCDLSLyIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="T9qmY/OR";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XQx6NqJf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978B5606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 978B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9qmY/OR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XQx6NqJf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gl222421715
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ao7/wXB+3/0
	9MsyV9yOdjkCOUMTfKupyz+iVks+8Wfc=; b=T9qmY/ORaQ/eec7EbCnXPgZufqH
	0tetghcIMyXod3hHqUkKDFyuhsogvweknWot8pj4G5a33fGZpLv7qedF78AJuPKU
	qWVU/Za5PDKcN7Gh2mLBa95GVx2ZNbyMC0DVGd1XTLD+PD9Y0WMYEsiplbhYfhRr
	7av1iqVe0OfH5Ay4B5XBotONZ09gnIYY2CTbHGNz/+aNYbDFf52in773lxMsd6vO
	osNLrShVyE5Nsibk+aFzmMtJ0dwAVhYYYRxhyWRMug+FZIKFdQWqZ3mOI7C9NSzE
	BDtd3BzsptVLxkIvh2N1OZk+qVJUCQvQ4AhI0+RnAi0XEtMu1pRzprVKb7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf92vdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:42:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b40b011aa4so9651868a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772529; x=1796377329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ao7/wXB+3/09MsyV9yOdjkCOUMTfKupyz+iVks+8Wfc=;
        b=XQx6NqJfPy90ngm8wqvnAPHvLgMRst8/gnf/Jgi0SlveraujpEcHpJRjJadHCgw5NC
         hAdAKYurzyb3NTEOkeX2rZIHuOIsDERRLBr0+CBDdkmUeVIBYpfKKHLuOWay/t92MD6U
         487aw/TM0H4gnFrnrhYwKrie6CO/qWqTy6tztgMT3CtV5EanqlFKx0tPu055RlkCJnHh
         xkBE2vwzSOdCFHlW1WO7EMVdSsu/C4+Ug6DtFXyKia+46uYqyT9lNGmuymbCNzD61UNx
         SfVwojroC3B/cfsGh6UNmIbbzKqphAg0d9QaSDpuds3JUrXwYnpZIpu2FH2tXzuHmMz4
         IWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772529; x=1796377329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ao7/wXB+3/09MsyV9yOdjkCOUMTfKupyz+iVks+8Wfc=;
        b=koQDZDBPRjvBYiQlFtepLa4qRHhgV2qt+YGezkdeNU5fKbRNbBg4rdYU72Fzx1Snkm
         tQc99/jnRhEyuj8NnWXkR8YBcGLxW/Gr/VOSfURyqTFDGC7dO2Dl4yRff5AeLWb4Q7pS
         zD6AAL8hU/VqaaofPuljlujImeEVurik9PH/VjbHSgPWOtf3xJgZ3mib/4/84OKPJyWr
         ir5pHMMMcS0WwngUAot2QQXgl2v8TnjUVD4Nr3gLRbFXzi2lDN0yli5Izlj4tupDAEny
         xZt8lXGAlQ2g8tMe3QzDnFciep4nYxE51/fd29gbHNH3r8yUvz4EJO7BXOdMEiKVbOg6
         v8PQ==
X-Forwarded-Encrypted: i=1; AL+hErH9bjaucZbzO3+W1HZUHXOgGYbcfMBFPKNqwfuKVEB/XjA5r34Py3aX/3YpXfTuyKvr3wc3ZcVm55auumo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DACL8XJwPVWnOV5h9o+ere5Y+BZbaMIjBaOQ+X/sukb6kRvR8
	VIp1EpuNaMltX9GNXjBmPKKVMLoZ2JgRZaFNlQ7Rx95FSoRjitNca7wqkdKeGQ917BX9zh6vm8N
	S3tdrxaw3ZZJOhaOnAxj71fqLVIkIMGNXiiIe17yXAHRIkZojFrLpxgUJAM+jPMtkQ/U=
X-Gm-Gg: AZFdTZcjDtg6xk1KCFelo6u4NndZZpnf+LjHnBCdmpFdK2op/M1IgKf5tcYhD3jctS8
	5rWM22gwRuUEUoCr1g6OTiXdKLqwNhAtiR/WwVjAq7lOaPub/3k8xk8nnN5N7mk5T1hxEf2+skL
	+6QAxhqmwzgCbtLe1GXG3HKd6xLn3+YkaShkqW/I7Z0uZlBhrZkhUM9IWmiVkmwqihgr0Ey+dO/
	4FZn1fK1SSQ2mJBqeop8+7WqpG0S1s+0alMpB54dce1eV+NYa1jiulUyhk1e1oSXt15BZytEVDa
	lfNT+dmp3clb7URP8EMlNaBVUvbgB1O/tjs7IYNiz4Rs3n9XyusftPwTwR8WG6XwpuPhnojdQ2Y
	Mm6p5/LtIxnY+aHJE0NCMs9dHdiLJxEop3HH4F63T22plot2yXn9V/jm1AnhMZUpH9w+JozjhuP
	C86hNQV/kAohYL1YdN7ngIEF3eWu8sdtnQXUS/KhE+3naTxH2yn2tap2E=
X-Received: by 2002:a17:90b:17cb:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b41c9bc517mr24941295a91.67.1795772529233;
        Fri, 27 Nov 2026 01:42:09 -0800 (PST)
X-Received: by 2002:a17:90b:17cb:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b41c9bc517mr24941266a91.67.1795772528814;
        Fri, 27 Nov 2026 01:42:08 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm16474788a91.1.2026.11.27.01.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:42:08 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Tyler Baker <tyler.baker@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Introduce Seca SoC
Date: Fri, 27 Nov 2026 15:12:01 +0530
Message-ID: <20261127094201.3296395-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179553708459.2320507.13109534858158405044@oss.qualcomm.com>
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com> <d92391a0b2ec19bd4d8ec0c4eb988cb0c8176b28.1795517711.git.yadu.mg@oss.qualcomm.com> <179553708459.2320507.13109534858158405044@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: EvEqUITKeg8LCIeeEgDDikAMTK2j2m86
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXw680HFfbgKWO
 eo0GDLBJTsjkPaA5AYCXclG+YWcmB+UJ8J1xpPMMBH/jNso33ZcV2ZgS9VOH9MNIrIr0dEgm5uz
 MWIUj8b97STutyPc6LOHG3JEc7el0gdUKqvR4duzsmksy2Dc/N8gtRdxrKxlU34Ym1WwG2OW46L
 uAcHMz9ymfBrbMYPVb1y4CHZPpOUSUwwUlAsLXoCQ12gppHn+XYyh/yI5fZaeFaUIeIx/0SuMJk
 BqFXohPxJzTy3HiFNFSEcqUJpdxK+h8cb349ICHMSAwOJrzz/6vM49oNv7QTsCr7+b9zVKILS2J
 oGh5Bj12Thrax0zfMJX5p25W4QVuRuetwbhhJslHEg5NNHDx+BaNkMCyznT5MdtKvRPN8aePkjC
 wlThwSUfl3fPJigGcAsYw4rrMQJZBuk9B1jYB3ZQcZa3IeHcg9iSUawxPH5Af34CeH0FrQLFwL4
 o52dsuieg3OJZ3KWUyw==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b095071 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c_Yg2YlBmAq_miF6-psA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXx+gA68cmwqVk
 C/pWK2Rs4XM1SM2oFF1O8G7FbTq5LeHngtjIb9FIusypOZwttSdKBzj57JxwLWTJjpJt/H132jJ
 G14u/NGKWRyvfeU84+09ie4Bh9QFeOQ=
X-Proofpoint-GUID: EvEqUITKeg8LCIeeEgDDikAMTK2j2m86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038

On Tue, Nov 24, 2026 at 04:18:04PM +0000, Tyler Baker wrote:
> > +                arm,psci-suspend-param = <0x0200c353>;
>
> On Seca Ride SX with stock firmware (UEFI 2.5.5-00052) this resets
> the board ~2 s into boot, on the first few requests for the state.
> 0x02000153 works; the firmware rejects the other variants.
> The downstream Android kernel boots with cpuidle.off=1, so it never
> hits this.
>
> Is 0x0200c353 supported for the OS here? If not, use 0x02000153.

No, 0x0200c353 is not supported for the OS here. As you point out, the
downstream kernel runs with cpuidle disabled, so this state was never
exercised there. This will be fixed in v2 by using 0x02000153.

Yadu
