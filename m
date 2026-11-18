Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982933;
	b=n9O8EYBPAuNA6YdjDYFWhQTT8/Nzb8wpn//f3BmJkjiXOfhtElwuC6bCekNfc1oddiuT
	 xs+ElRZM4ucD9zdarYJlS98Lq+pSM2k4GsyzXUn6dPJH5PilQsBbm0sWGfYQi3Aim/bnB
	 HtMQDz8QV0J6YvSGU90a5Hqc1kd0vZ6WghiAu1Dg1RpIe3F0w65im86aU35l0jp84ag/V
	 K3MGbQS3bqzAaQHYEiY9TaU49mEli/FGwdLlitpvapM5zEIggysfds2o5UJ9sR1KMB5Bv
	 sV4uFrzr5NqHzehTCMG1sDzhRxP4Xj+JB7N91fR2oC5aw7wFMzZpkvnkMICGY/1VIgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r22wSftw6QqLEA4uzVI3UhW3Cr4U6qDqT0b5uu3L5/w=;
	b=rXwZMe7CYA/gS/KpPDo0glGBk6CaWXzyZMT3cEE5xGJPm7adE+r2K34H58vdIAfMyuGv
	 HvWAqjdE4Bq/KjGt36XnlI1WHroCD6x6NEciyGlTsBNaTB+7b1tfefH4slE8qSf5nF+4b
	 eMbKVIRzXOC/HB6OInCf7CBrSRpqqC0vmhztxSd748rHY2T2IpoPr+VcEQjLcseeQAvCv
	 a0Iwq9nIhKg55sxN4Nc5qgYC2ZWWtasmh4R3lw29kECC9lQTZU7wOY5bcFHkZenzra4EM
	 XzvgJ2QyDyYsDJ/Hy+CaSUs7BYr6uW0s1JD1qycNTp68FwAfHi3fPSNfLNvyYWM8ljA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="StJ/nTMi";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YwcS1Tuf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3832B606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3832B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=StJ/nTMi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YwcS1Tuf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2Fd2106333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=r22wSftw6QqLEA4uzVI3UhW3Cr4U6qDqT0b
	5uu3L5/w=; b=StJ/nTMi116Bn2n3uaLjbDglrMXYmkOmt3cl4rVE8mTtyFYyFgY
	PIoaJH3lG1ucLeyMnBfKCxZH2sW/RwAmNgk8BLGiipLEGDAebCzyQcaaDFTadc6W
	ffXhMMHaQBQ5G3EtlvWG2uXM7Hf42d0x3R+xEPPwLI9R7FFmQyQPwvkqUOWx0hBB
	7SVpiNxAAKzYKE2D00yq8HYm2zHp9s4M08wK7MXh/cLCAeIsCIyFnVTgkqpjHJVo
	yKzQbZHTMKYwYVBcOyg+R8+fwpJRF+TOH1dbkmcjA+wjuaZ62RkmW6oY8sqyOJ7s
	qCSnAkTR2EKuhzF2Pvugic8No7rpBKjn7Mw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sgky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:22:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so736586a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982931; x=1795587731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r22wSftw6QqLEA4uzVI3UhW3Cr4U6qDqT0b5uu3L5/w=;
        b=YwcS1Tuf88XqEQfbXjtpAkmo5doLWwmU4meOyaRKLv8a0/0ai9uuYby66MkUMJNOKY
         XoxJ06eukLpkE9ArUlSS+W3vHkK6JENR5Manvkx2sxkDerz4KOfezGjdhqfEPFYGwBSc
         s/RUkxvtXaRTgjsEcLFmpulXi0Z4y9rz366WXxWt5ngtwpM+6EMKLc0EAmVSlrCm2g8/
         EVq6A7jxDR+2oAAR08ie4ym8qeND442jNFBYBxCloSLvf5ZUB3/cSsAuyKyImIP9t3zR
         J0NHRRML3jcOm8JFL1X3+eeQN3+yoEsyqNAV9v8BdTIEDBUipR56xVv2BsE8ucbdys8u
         y7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982931; x=1795587731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r22wSftw6QqLEA4uzVI3UhW3Cr4U6qDqT0b5uu3L5/w=;
        b=EqRnLSvmkeo3BSGv8ueWc7pTaKymZ5TnAfngdSC/uSUaI+wruE7ppnJnd/f+AEAQJD
         nRsEfgEjVBAwaCYKB5KG6YHAA5blfcv9F1wFm8tSbp4qPQEKXqxO7+wB0xMR3HNwL24r
         B2Z14BI8w2PyrAl49wI3zJI2wukCeCdn41II9jejmEZxUnAtdJ3bdF00kEtHyYrOAoE8
         VKlx51i3kt2/so+OH5mCekcGlcEJwXc5BHC20Neq5FPZCJGRIJnEum/obu/0A4wG9DKd
         SCC60Abe90ArJhExmazw1kRguLSZ/RFyTeyDe3+FKPZtdjjGFmw9uETwnGl3O86T2Lvg
         V+6w==
X-Forwarded-Encrypted: i=1; AL+hErHEdUWajvmHZ+2wfTuXBze3MCZWGc9Pr/eKk7jjHlE4YVpzF7NDavW2p3Vsxst9UYV1loaWoJD5jxths2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N9aL9iFI7PmQYpuXU/CKXKhv+QxxutCnfsgiSJcpuVO9YWNOT
	ZVkFfAoOZ+0INdHQB0NXwmnxvB25puHFliQL10fLOpnutUujdpVz97EP4wXpZYy7LwLX23xrXkK
	Ym2i9oq/CdiYd0TsbUmpIvszQubVLvUAyPm2NrZGy2tpRHfa28AZmEz6t+T4SVwdnqv4=
X-Gm-Gg: AYBFou3czu6A7RD+971MU4lTuiqZJYb9volXkaWCJTe+bumBYt+ZxoPpHk0pkYLWSLS
	moPFfAZXb6/qiklS8Ee+C0Xy09IU5aIVvIOqbGy21XTrDJQSLU82TlG15tTT7WC/hMVRM3X1Gj8
	hK+ch/SCO6P3WzilnnO8puu4FmxhRxUZahDaFFvUAZGS2+9evHGxbZbiX4u6cCtYZt7dLrwNlvr
	nLjigH2VWqiVskwu36CjkHmvwFwJU14KIdFVpduuDYaSzHqNXlHRB4sGrEbwlDr3pB3M3m691mi
	fkoFBDt1vW6djah5r6RTi9GayMWbctlxaglU+8opEHTnB8oBSIO/XvsqNAzSJpLd9+EsPuSUVtj
	71tqlWlzTfgbKYMt3q9VKEOEw/2aXC5LCSkpLO7aTq1ZyuQ/jNLDHYJXQWmo7lOd7C/L2xDPa+G
	gjJQ==
X-Received: by 2002:a05:6300:141:b0:3e2:a849:64c0 with SMTP id adf61e73a8af0-3fe8acf786emr1864295637.51.1794982930597;
        Tue, 17 Nov 2026 22:22:10 -0800 (PST)
X-Received: by 2002:a05:6300:141:b0:3e2:a849:64c0 with SMTP id adf61e73a8af0-3fe8acf786emr1864279637.51.1794982930170;
        Tue, 17 Nov 2026 22:22:10 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa2a4sm619916b3a.12.2026.11.17.22.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:22:09 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH] .mailmap: add entries for Prashanth K
Date: Wed, 18 Nov 2026 11:52:04 +0530
Message-Id: <20261118062204.2314394-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: SZ6JmtsvlnDQgIl-k807cGWUAmYSUSwK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNSBTYWx0ZWRfX8p9u1lJchcYC
 yz/DnfyoFRpoJq5hnYDoAUhElzmwpcweqgcVehMS7tRX4zQkzvzqcv808ZcIk+kbdFVD9jo6/uG
 TPRl5dfMY3Zq9nc8Ak5VSGJqIL7mnCg=
X-Proofpoint-GUID: SZ6JmtsvlnDQgIl-k807cGWUAmYSUSwK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNSBTYWx0ZWRfX4wqOGjabeSIs
 FMLxzxIADm3zkMKJ0bMSVAGFHsqiaFnkLHY1SZ9WyQqZtmzBpICbIgRKXl2l4cuKl6Gh/2HSIWQ
 GjyxEVwCV9Pf19RiW+J8Vc931R5/l8aDbOiUBDNUm8KIC2HcWzzgLrfpBSBtrIZwg5PLhjw1ZNb
 L53+YJ4Ap92x0H1QcsT5WLlt1PMb2paqKXY8la2F2uaUYkHjazz//m9ZhTBslsZNkOL3lHNQW67
 weMryMN+hZxTrlyNlBEu3ScOVUtgOfZUu6a/oTMjSBwJy4iZRgQDB7DNkX3bjyyyLlgm5+P+nH7
 dofSbwXcg1L8VQAB9aoJFLyk8H2emt7Idn5cCjDMLR9lpUtbpp7zB0yqdh7pYVJXzoGIaqAGamz
 cNqfieUmtVgHYa8f7c1WEzgE/moR5QZhEXc0L9ktmb4/24Egt0HUokxRRIzXt0Q+2Lm6kyS0Eqm
 rV5QMoTSLPdLAQ3es1g==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd4413 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8
 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=r_1tXGB3AAAA:8 a=zMqgFnQWW24czSXJCR8A:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180025

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index bb8cd0c84747..f26a9beba759 100644
--- a/.mailmap
+++ b/.mailmap
@@ -771,6 +771,7 @@ Pratyush Yadav <pratyush@kernel.org> <ptyadav@amazon.de>
 Praveen BP <praveenbp@ti.com>
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com> <pradeepc@codeaurora.org>
 Prasad Sodagudi <quic_psodagud@quicinc.com> <psodagud@codeaurora.org>
+Prashanth K <prashanth.k@oss.qualcomm.com> <quic_prashk@quicinc.com>
 Punit Agrawal <punitagrawal@gmail.com> <punit.agrawal@arm.com>
 Puranjay Mohan <puranjay@kernel.org> <puranjay12@gmail.com>
 Qais Yousef <qyousef@layalina.io> <qais.yousef@imgtec.com>
-- 
2.34.1

