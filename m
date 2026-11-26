Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694270;
	b=06966naDDApj31y7uykio9oSwDfI+Om4MBabdJlBvl6ysv1biOgzMSJIK7TmBxb1DhwS
	 JZieJBzXzqgz1pZNsO5Cx/Np2vkBZsgjAwZuO8uPyn+G/GeKMADG2GEkCa5pCREUODrK4
	 TySxHgur+kbPENuWU138wcCdy4NpwLGFMQGxDbrl7sPt/oSN30aABGe8AnYEmWOjxzXFi
	 zpbMpgCV6d3w5gC8G4xnsa9TOaIQDsDu20BRsv4qo0DxNYKTRzN032/LpRNq/dGIBCkMx
	 mCqgFCOSy+B67gRc1XyIjoDU/f4Cnljo9/sVR5iESpEuUjygPZUwEKsDNK1SwdD1P2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694270;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=65dy4D0vQNHIbdge304u38ErnayG6vQ30Zwna7XuBUQ=;
	b=OmZogBUl2WWSKVI1hu9mv1C6LvI3vzM50A3JSUeX4UXRF+TciaFv5ncsE0+xBmd7Y7ez
	 9RCylN4RABU4DClA+bl8HmnPSMgCzPndKV16mTvnz5fkZDoJz5cj6mV2asABM6v9cf4RN
	 BR1GnO6lukpdlc0rNblYdV8DE2P7sBXeNUfdtn/r7c+d+wnsbCkhms8nLs5VN0xgYxkxR
	 DeXlvs/uPBpLdC1DRlScNjo90NOugCS6oS2ocZJi3PgMbAsswwkpIbX0tVjPId6OKNrlt
	 VTdSoKynbTZpnOFrnW+eGYbYm4XwQZ5PdIAobVdkd4qpOK/UUtRpAGTa8jzDYKsjIVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nyvRP8ge;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iic6fVjz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEC4606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DEC4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nyvRP8ge;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iic6fVjz
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVcpO2758861
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=65dy4D0vQNHIbdge304u38ErnayG6vQ30Zw
	na7XuBUQ=; b=nyvRP8gebq9rZDDl6lMUCXRjn7xtnLImqZS7S46xS184uJ34S6W
	yhuJBM6VUIqQN1eMSgkD1ZnfU2/WACDXtnljCG7g/Xq5WS/4dRZSVw0X42bXTad3
	8CS/zk2BEXh04LdNhlgFibJfB+PD2I8zhTNPMdCTUtl+jUy0x2+89qxisqyiKg8w
	ACt/HlNJ2vMd5SxCADq10i+nON957z1PGQEVukJah7SknYhkDBVZd0JrloCQDR8h
	9Nm48rnmtmcvMPRdjan3mzn28uydyCZNz5O4Ecafty9ycvXpIMnV128Dl+JvKbjK
	T++LEdoSnneJGyuXR+28JfE18aRVgCkopkg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahva7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:57:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so1272808985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795694268; x=1796299068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=65dy4D0vQNHIbdge304u38ErnayG6vQ30Zwna7XuBUQ=;
        b=Iic6fVjzhvM3ddDCXJLYb8bNhYXnFFM238MzCPfga1Pjbx9U59JE/M8x89E8br5pEv
         2vtM0gJKyUGl2qYOeOzffO5DZPaWZ97rPIpShZ4vKqJ8kIaWvYFIk27SYyuWhQRh05sd
         sA1kxzD9EbViA3qt5h5jOGpiagglF1VT1iCd2oNPmMCU7eqebz1oURFSjRxEM/xHyGaJ
         H01fMSDMgIngan+Zoj7FiAyDyNBrZ0XUj3p/+cL5juPbYAmAIsP1dXS5pdg6iNgt3jSJ
         JedHIMb8lE+ezH6wlSkEYhYwwfnfN4L9fRTgr/Qfqk22BVAqwiXxWSjWmYUqFt2xwrTD
         pxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694268; x=1796299068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=65dy4D0vQNHIbdge304u38ErnayG6vQ30Zwna7XuBUQ=;
        b=Z1lAhAoHl9iCSaKZypMIi7eNGlYtLoPLg1BQhRlCzfbaF3NagIxxxxW7Y8eeKsgevh
         4Hy8XShAjN/d03/qZU054idXg2ij1dmXmFrH06BvMpUiQORHHU/U+XdWuWAbqEKq+7lt
         A4z8Rsqr4FqIYGEFx558ebIowuE1jt4wyoAQ1Fk9bgTc2Ia/bBi9i/sg1RRYCxQG14VN
         mEtM4Rfk5JrvEz8IOujaoOw27Tik//E1fqQid8HWCEtULqXUmcakgcJAZQ9TOvAWeRsa
         GBnIb792KDy9deACeTVl8cApxLiALV/SL/b5pdnRhnA+RCxkLoX9tNied5/bB6m8lzD5
         Wj/w==
X-Forwarded-Encrypted: i=1; AL+hErHj3+xY0zWEuoSaXhBAPXa7vr3lvKiNEx3sOXT7TCZWPQbVz8/6Wa2jKkhiklqrOnyN17NvBuZGh3x+4zY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aCqqrdk7G/N+YCdP8dm11B41KCOijw1cU0I0aDOlI/s3CbdbI
	JEF8mdcf39Creq9nGllV+VfZkluqbUknzNZw13cInLIFrMCrm9W17kYABfioaHhmPqwsLzvGQoE
	aPGeO3kNYKkho1q3V9+SzHvolaBhpj73adl8u7p9U72G8J4ruSadkRUXt1pafTFbHZpw=
X-Gm-Gg: AZFdTZfz5RD0AnA1MoSwepqiRnA5sKLITty2yphuToqa0jVgwfYNmmVDadeTkuNJO7c
	nFeJeIue2Ng+gETVQl20/snq6I8jf7Fwy+SlmWyRyrQIvgsVsn4kNL3QjVmnB7VTJazi4KSwZ+y
	bPUEsFNJulYkY2SnnfAohqTn7ETeJiLjhpK2upSZC9XaTxg63y8qnuLZU7Y+7HN56U9iYnwUfTU
	8swSzKU56SH+1eOgjxBbNAjMdgc3Uu7HJ/6wVF6e1fuxhCo9ASgg1DQn6rOKfZTLUeHv+S+vbpj
	ek1XUwgwqx7+2sQmAwKfGmdPxjF9jbGjSJMCdxvThbfdrB+1LPaCaab3ygih2VnEs4ru1j4CBiv
	BRCkP2AwY0Vdyk6YBQAFQBgIK+vDAWR6bqBHr1G5S84/JkVqvWqVEptmOL8jEZz5e
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr3628845585a.42.1795694268233;
        Thu, 26 Nov 2026 03:57:48 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr3628841585a.42.1795694267654;
        Thu, 26 Nov 2026 03:57:47 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm39533135f8f.10.2026.11.26.03.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:57:46 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Michael McAllister <me@michaelmcallister.org>,
        Riccardo Mereu <r.mereu@arduino.cc>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: qcom: qdsp6: fix 24-bit PCM on QDSP6 ADSPs
Date: Thu, 26 Nov 2026 11:57:36 +0000
Message-ID: <20261126115738.1765949-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-GUID: kec_nSlD0r_QB1tuInpjjrDAoYmMwczX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfXxXzoU43ESg7I
 UZX5CiE3z39QRArkXIaky4lmr1Xdk1LuIHL8EyEVKUYLA22R/F4rBlTjmvB3BB1hVBwLcSucxI0
 Q8U7+6EvASQqHqQuHfRdm+xx35IS7y4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfXxcMaagaIJI3t
 9vL08OS11RKkAJnFjQ3HcBjgykCF+WGEN1ubd/gpTplBoeIiHW+zfsce0Nnf4lRWPWq9oRvwIKk
 ySbpLViGVlZo4nkwEOcyUMaSNDBhcUwdtAWQKskBIq4tDkS2MbO8TTrcxrXBksVzEaZARGyyMB4
 9wt+hEJilJcjFWWS1ltqt/fuyJ4cG3619iIPwY+m7Qvm90U4NUqQmlSe0xgiVp1ENfil//WbaoK
 gMBOgF8CbJMjiE45fk/PPLXRj5qXy0TKrV/K+4EcbFRAXLsJ4uKLda/QwgnvQZ0Ez4/FBbOcCv2
 kQ3t/3BGrq9OorTE3TZTxRbQb7qF5iqKPSNePEmaeuMjr7/5H62NEcSNQMN1hHUZJFiviYF0huJ
 rAjewrB5yfi5JCpFVnGdz5If8xb/cin6xDTKpw34j+NzTxzhRupRSM7oi89Q18mQSEBOkhaiaI/
 7hIJ0rl0H0ipNhEjb8A==
X-Proofpoint-ORIG-GUID: kec_nSlD0r_QB1tuInpjjrDAoYmMwczX
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b081ebd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=JwJ85b4fAAAA:8 a=5u302ktTOndDhYrJvdoA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260046

24-bit PCM through q6asm is ~48 dB too quiet in both directions.
q6asm sends ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2 for every LINEAR_PCM
stream. V2 has no sample_word_size, so the DSP defaults to
word_size = 32 and expects the 24-bit sample MSB-justified, while
ALSA S24_LE is LSB-justified.

Patch 1 switches to V4 or V5 based on ac->q6asm->ainfo.api_version,
plumbs sample_word_size through both playback and capture, and
drops S24_LE from the MultiMedia FE PCM in favour of S24_3LE and
S32_LE. plughw converts legacy S24_LE requests to S24_3LE
transparently; clients opening hw: directly must pick S24_3LE or
S32_LE.

Patch 2 (originally by me, rebased by Riccardo as part of his
Arduino UNO Q DP audio series) adds S24_LE and S32_LE on the MI2S
playback BE DAIs and teaches q6routing about S32_LE.

A different approach was proposed by Michael McAllister and was
developed independently:

  Link: https://lore.kernel.org/179416102230.53258.7301268454500974217.q6asm-pcm-format-v2@michaelmcallister.org/

That series keeps V2 and routes 24-bit through S32_LE + msbits = 24
so plughw repacks every 24-bit source into a 32-bit buffer. This
series carries sample_word_size natively in V4/V5 and advertises
S24_3LE on the FE, preserving the zero-copy packed 24-bit path.

Tested on db845c (SDM845, LT9611 HDMI): S24_3LE, S32_LE and float32
at 48 kHz play at full level through HDMI; S16_LE unaffected. DMIC
capture at S16_LE and S24_3LE verified on target. db845c reports
ASM API version 1, so only the V4 branch has been exercised.

Srinivas Kandagatla (2):
  ASoC: qcom: q6asm: fix 24-bit PCM level via media format V4/V5
  ASoC: qcom: q6dsp: add S24_LE and S32_LE to MI2S playback DAIs

 sound/soc/qcom/qdsp6/q6asm-dai.c         |  26 +++-
 sound/soc/qcom/qdsp6/q6asm.c             | 184 +++++++++++++++++++----
 sound/soc/qcom/qdsp6/q6asm.h             |   6 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  19 ++-
 sound/soc/qcom/qdsp6/q6routing.c         |   3 +
 5 files changed, 195 insertions(+), 43 deletions(-)

-- 
2.53.0

