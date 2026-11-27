Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794942;
	b=cbI3+rod+3AFcXQ55GTgsqYoB3DTqpVeomc9WWKQf/NRllWxrnxJRgGqWd2MUsWXGzkX
	 BrTa7mtjQ1lK86y8kQZxigEE3UPiSvryrnbjUG/DUX3fZOadIWmf3P44CQJiohFEpCRRs
	 Fp3h7BIhcSBvssdO82nJr2jYhoIWzJBrDQziAVDaGAhOOYBPU9zIpww1zqMvkKghPsYMY
	 SuXwRnABTPokkDkBB9QgiDEMCm+YyHbvjVR6Hg0lWfudyo7ang73hMye+8s+1CZzloHWx
	 3v5lnOTBU8dB2aNtuxMmVpnlEx9gpAn6/tduqyw6FS+Hz9VqPPAKDCEuyTPHVVzj7Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794942;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fXzrguSt16bKvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=;
	b=I6BcKm+l9gkfDuKKLqQHwvHCnv89vJ4SdfBWAm8+92Ykqb1r6RDUKfM3p0m52ks0pKtO
	 OrLFN1YfKtiqAFQOwgMyDOjCoJwFkrs3TDZiftT+zM+1Yd0A20soJ5p2vZ89FrfSRb3ya
	 LqkdeiybWUGHDB4mdJdvNvtm7QtAQrFLixKyOGhgMSCC27VMP3Y01agluCbKDWUWgje4e
	 PPwV+mcpk0mWACPvGaVelr0nHsZ4w3BlczCHuGPWdaK7PocthFK4uzoOupcJAdpcRUEsd
	 4QbSygiAxQPfpTDtsfTr+mFPwrI2eImQy/+qaTASh7dw2Go3tUk3O3hitJP49urlkAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTXtzdZy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VrqLql/8";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDE7606A333
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDE7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTXtzdZy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VrqLql/8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp09l706211
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fXzrguSt16b
	KvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=; b=dTXtzdZyWeZRYd/GNpMeBB2pnuR
	TFkZsnGPJQcPVKJ+V48d6gkOl/DgxoXyhai+2o6osef6fWgTCfF7JSmroOfTwlK5
	rLEhZ2eLyme4c/htPanYEYerA5mGWrhHx1FcsjIPjK+/hygapRd9Epb1CeblhCNX
	hd5AZNCeuxX4WSdVvT2pPstTyKHfwJNaZKKVOeozSMwiCu52a1EwAZ9GaYisVF6a
	/B5nDncfze1e1uMuUxgIVAp4JE5vxqxCshTLSTIGCRaJuUNWG4UGNYHA78/RKRX+
	e5SrfxZkAEZfNfzLzP0uyjfY2VAnnBaPWnP9m4FrT9+X1HljG9pDMKvvr6g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6t4us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9210357af78so128566836d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794940; x=1796399740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXzrguSt16bKvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=;
        b=VrqLql/8foeES9Tvrh+Xkd/aFXfRM5epHuXARmnH31gJYeM+H/i+NYCTrF+4gZyAaC
         934eajCqZX0IGiUNFg8Ez4LHezV4xGggmXZ/aewn/KaXRd3G6XL2bkBxrTQD5aqB1/PL
         bUEPRxixFbYpWNXNKssYXsBowxnlXJJRPZpbrkpBf4g6rOrgnjLCjh6xi+AlfTSE1CAN
         mNqyTszcyTDav9+Gph4HJu1/eJYz0d1VhE6PK7h/oIhdZgqVMmmOWGossXOmkdVvJseE
         9I0P/JSzG7mHGB0rqSColiuIKN8PqId2gwhCR1AcRMD7lyqDxFiAoLiHxHsRllASeniz
         Ni2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794940; x=1796399740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXzrguSt16bKvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=;
        b=e9oRJ7yITJeo6mxgYHbX3wtNdQopHsB+PCM3Nb3s4+Ydw2SzJFGXY7EzVa2OdaAPdQ
         CkrUcqs4LZ+1Y6OSF+RjGQgNCWRqdTWI4BzuGaseiEl6vzHGMjve6qYmygvJ15+hgdD6
         43uQbO7pygBVBgbWiY8ZiVHH7PRDWIQE4M3WuQJosmJnqM3L7MBO/QNhokpqxaf7KMWR
         7KIB6oszHk8vyI3X7VydRucd5Ay+Wy8omVUSG/ZKB6/T0QKK+PJDHsvj98Nlg/DlZ2p0
         EY8sjAJrTxzwaqQtkY9LpqDy9NEHJpOEB1EZY32w/CSLg4VBd4fp4/nhAARKIe5KNqR9
         3JnQ==
X-Forwarded-Encrypted: i=1; AL+hErFZQHl9ziWa7hk/lhDYahL555fY9T2S5dT88uug9DyuMnLFsmbMgOye13sygboB+tRIw9USbcHi6Oydzpk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AihFeh0ws/CTOKzvMavbqC8vd7EvbdsmSXw4PAVgJCw46zSBg
	N5x5am8+B5cRSouXkQaidXDzEIfrdcDMT1KRqmWS53Fuxp62lGxbGhDmeYBKzBY3ufjNNBwJca1
	R2mk6Y1GiYxNVRCSqw/oeRn7LPT5e1DaaaoDiT9+ebTtawanYYQ5g/WriA/LhBKB/IV0=
X-Gm-Gg: AZFdTZcVwffcdIGyHj0oOk8TMufBZcwCdtlb7BYvtuhKOb5cSTyfNPVqOPrXiiFJBRU
	m7WcO9uvQ68HS+SnR0nw3N7glnKJbglhdL16rabG1R2WavxOSnBkh8+FqhSOJlTgDDvaJTMa+vK
	DBbgrTYi2glHFqY2G51J/saFhkdmaPxDwegeG4PoFbgljP8kfSTM0p8fnQx5mlMssQ92nHlmZ8h
	AiYQH5uzqe+9QmnAJU0icRBxJdMmYFFYEG8RIU+kuFSysnGWFej+B34LUnZD5JEo+9hoXVyOtru
	14as5HY4sVdBJuPoPMrQMJD/VRN7Uewyg9ASycUNuRaoALB2DNJWidBrh66+7T9O4LoGs8B4Eyq
	/9ZS73/25t30rSiOTgMlWg5kDdrJ5ir/jFZe+xEJh93XkGlMBnKZYVCQmgitYOdky
X-Received: by 2002:a05:620a:1729:b0:949:6fca:5482 with SMTP id af79cd13be357-949b3858dc8mr4431890285a.42.1795794939975;
        Fri, 27 Nov 2026 07:55:39 -0800 (PST)
X-Received: by 2002:a05:620a:1729:b0:949:6fca:5482 with SMTP id af79cd13be357-949b3858dc8mr4431883785a.42.1795794939516;
        Fri, 27 Nov 2026 07:55:39 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/7] arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI links
Date: Fri, 27 Nov 2026 15:55:17 +0000
Message-ID: <20261127155520.358909-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: AHpcSNfBuC934qNXjMxLTPL8cLb2O3BO
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09a7fc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=7VYxjO81rbqYX6bM38wA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX3XW8DnP4XFtX
 6U/82HyHnMlbLtbRrNVxI4KwXiHR6SDK87MTdT+jvmHixf5b/ziK87yQDFiOPl26D3uuqBtsh7D
 sfGvTgm+bKSjlwrLRyP7GzafOq+HZcY=
X-Proofpoint-GUID: AHpcSNfBuC934qNXjMxLTPL8cLb2O3BO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX99z5LmdSKzFo
 U6Qty1UqPdvD17eo1CINI6MJFSyn7nCTtEv8NdnM/w32SF7KC9fyWwE4CczMGvGjW191MfCM6zm
 N5yyqZtCahJsmRN9UQZGMhLU9bzrI3JMEfoiwdkRSRWplwb6MGeu9sYDCkIoAGgS8CWX5v4LMe0
 l1Nur4fuC+IvkxaOfi+IBb8ohFpWtSfJ81a4nz4AG823GOyLyOtMTq3dHV6XqNMAWZGFUkNW9Ao
 j+NefBwWlPatOZqLzUU4YxZ3q8SJ19VEOUf/vScWBn1ppwS2nlQlF69UOCTX5hNHYNl32uFOH+X
 CClwdUIUWbvmIdJFCKyYROodGW/uoxy5HPqe5+m/vNSoN0iiruDqmr7beh/ElGqFCIwWPupEiVW
 i3JEVUdQZA7nB4UxN/7uRdXZzWBHnXy1peiBn0k+bjmwcQF/b+TIMjbueSOBnHyOhMBBPqT0v2U
 esD+r1Y8/HlsFhU0YVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable DisplayPort0 and DisplayPort1 playback DAIs on Glymur CRD,
matching how Mahua T14s already exposes DP audio.  DP2 is not wired
on CRD; DP3 is the eDP panel and does not carry audio.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 8e0dd2956882..cdc24b273877 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -298,6 +298,38 @@ platform {
 			};
 		};
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		va-dai-link {
 			link-name = "VA Capture";
 
-- 
2.53.0

