Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627128;
	b=poAJ8ikYy8z9yVJFoIQbKi17TBWI0RcarLAtX1DUFPT9spigoSAi2cgZppbSC6kybiqM
	 929y+UgTfVUeti5rohbehrbTSxEtmCfO4xQxzdRtEz40OootyLjGzSi+3ZhAYDpzkDotA
	 0Gke5jAtb2ddUQwNRN4ga370vlnzNtpQleRaOvDWzvDkn8yMhAOqK3/zzA0bUdzPDOb0B
	 sVg7+7hHM1MlM/XdQp26Yv49GDz5g745MqFnVhTNnQIb8h6MHqKyHSjjd3HvyKrrgXlla
	 9i9WKZ5FRfWfKs+mM92sqdjkAnZ+qAtKNpMbidPB09XRb6Ldl9TJnTKBngA2KUYCFLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBYz5UHPL5U=;
	b=mPBsK+coZ6/sFdKkE8t5OHpu2gAC++8lBRWkdePTa6IQfpN4kaVRlCMgjSCTHcNYNST8
	 Zj4D1SkoDqsQ/7hDQgTKsvADh6LcD4YtI0TbMSkvSdA9LW58AE1on2vqWu6o+hRDJOXEb
	 jNTkmjW9Rmv1zuEAkMzE1ooZNQHcx0P03G1Qopjdle14i68swPKYJCJuZMwI9NRZjKRH3
	 8VAVxH1m1hMXk8yHG9cLT5cV3n21ruYVDYiGnN0HhxFgiViBfQbpvqR9cztoVTZmmK9HN
	 elnoBoHcRHI9gq5Vsv3K7D/zuMAxLh25otWWJtiFB/KbRaArigeCL95GBgr4YCaQ2Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hV1dUmhF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IIMibaY4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68302606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68302606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hV1dUmhF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IIMibaY4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQTTr454233
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBY
	z5UHPL5U=; b=hV1dUmhFcGwxiMvJ/HgN1LQ5D4biRwZWojEGn6SFkVkV9B9HpUU
	xPYZ8SBB7tyLjo5cTu0ivsCYXVZMaCahWfiaNP7E/LPo+YZhBNYvcF4roaJGjpjd
	p+uXejDi66RNtKF5XcvJYI+HhTe/+oJ1fhXiEL7cist8FU90ZxNSt7KvGzaSAQxl
	KnLlw2L/JLY8isXn/0fjX4CEUDEANYsVXM+v3RzEuv1r23xXmeS6OvEMM4pz2e3u
	dZ5usAb682x49tOVqi5vmP6LiugzZxGRbl4xR++KOevDQvNC9gerSnqLEFHIKHKc
	p0e9cVrTs416wPBv6svPixgUYQFz+cj2FhA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2sydy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:18:46 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67d98b79858so9816003d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795627126; x=1796231926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBYz5UHPL5U=;
        b=IIMibaY4iOXLrIukeWV8zFLzDlVnf0cEoXhVEErs7p11D8u4ypPfwTcyjc1pNzgO+Z
         1ZaozxIsonPmCMweLeppYWEnvCjDNvWEavT43cVlfha9cMcgj5YHc1LCKwq7rvoz6g2a
         YZBdR4PX5agEU05n4yleZUWqMfL486yPSPHksJO4F33RSiGWiq0RKRayTQSlDrfrdEo3
         edfm8HYUnDCwnff+NEq1pjjbSASY+opQFkGE3jCJGSHv2pmt6gbN6dFUjA3XQgmpNdCO
         mSSfVTKp9xPIHqbtN6tjE8S5kXoKVI8sI2xnvNCBtXGCEldPFg39WPHorFYfC3coSYqj
         cjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627126; x=1796231926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBYz5UHPL5U=;
        b=T7nRPnpZg20akaP7H7UYtwnAotUZvewt9WI4nYtn8R43UiOZv1LWC3SO/Pkd5tN3pA
         VYaSvFEKB13mrRPGHBE5vCvTlyQRWGzoizjp5HKnJkU33lZR1oK0lhOVhLXYXYpMLLt2
         Sw0kZu4y86Q+ifF/Q5PBl//K66xMO3f60i+7XL5kHwrHZbEKQHdnXTFiaCMNBWkK0jCm
         o9mjNuEyDiSszAzl+VMbp8FXrkvBYmoEiktU82yXXBabXvqyZ2WHA4O56Hmf20Gaqlz2
         ddRyfH5xdwVhbM7jWDrgY5UCVXXotV8vewkuGkVSf5dBGdQueFyuB91HRbCzqC25gAQv
         joNg==
X-Forwarded-Encrypted: i=1; AL+hErFs6Yz6MiFvgFEHB9pxohnQPjO7h6CE9KcjK3b3cQ3kjPiZP2NL0Z3Rqw3zMfATMFXnWHrUHfAg5fv8cBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z95+U5oeRuTs4++wS0EiH5DWhMqHLB5Zut7epbbT3S35P2kwFux
	rqysUOUiPbTActJEOsji6dPEKP3BSK9mZDyhpEdLM5OUhj5RLvpQdxdV3tow07CbGXHJSjNDDLg
	VmyhvrU0Ln584cIryeBgVTYuJn+1Wi0OYRhQ+nBS/bGtLXv/5PQmm1oN23Embb41cvL4=
X-Gm-Gg: AZFdTZdZadIiS7pKZ3rRXaVxZirMXZnoEUa7REVx4eGdyUffOURcES1upO9R2NgCnPA
	NRXwv6HJIeHg7a7CQvrKzGPaOpTznQ12/wZrDJzdBoJG4Elz75QPGwc5T0+IgiuMX0qFY8cM9em
	CxgYNxU+GQUDwyujNeppimkmBk7mPWnbELCF0Fdt4iqXIwXffWCu5x+7quPwdbeea1UUntevnAT
	PwySOfTTHg8VIeTP1Or7fgrjQMi4qhlyaWmkHBfr7O2ybi9jKd6AZGn+AjpoTC4hNN3OTKTKxMI
	C62px+GGRDKafymUx09FN8w0NJOFJ1viMFW9axIGMNoOleRIk/0ucZtrjVHdbgyBIfSeRfUM/2b
	rv42P9W1ZZov02Bci9BtPoc5Csoa7OKEETyAt9bCvqEkb4OAzcpfj/5i3Ns/oi8nq
X-Received: by 2002:a05:690e:14c7:b0:677:b7a7:ba38 with SMTP id 956f58d0204a3-67df42b4d6fmr9127717d50.14.1795627125797;
        Wed, 25 Nov 2026 09:18:45 -0800 (PST)
X-Received: by 2002:a05:690e:14c7:b0:677:b7a7:ba38 with SMTP id 956f58d0204a3-67df42b4d6fmr9127699d50.14.1795627125392;
        Wed, 25 Nov 2026 09:18:45 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm42096548f8f.21.2026.11.25.09.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:18:44 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/2] ASoC: Glymur LPASS macro codec support
Date: Wed, 25 Nov 2026 17:18:29 +0000
Message-ID: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfXxNsrJJ03adhM
 2FPqsfCkGK3nuxjcVu9Vo9kiqWvNhtM9VDX1pf0iDFwu/JL1zYqleVn80fBs9r0+XsYBZLMlYoE
 ReqLmytrHY5aax8O4mrxK2/EFOuGbo8=
X-Proofpoint-GUID: APubfLFEqVZ9rlQyq4RdPnzdE_-thZDR
X-Proofpoint-ORIG-GUID: APubfLFEqVZ9rlQyq4RdPnzdE_-thZDR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX+CRJngKh46B1
 IOmhNafr0QA6qMZe9wetTQpqCHxT1hF3YHVwjw7Zpor0hJGDs84pSzXoK026QC0AP/wnTBVct/Z
 Dy8flp0yugq1AElG106qrkYxHJDSDNCJ4Mbs2hQ5XKpc93aG7UVo0xc4WlF1i52+wurHu7yRLbe
 rX4lk1DmG1EVVgo/NsNV/CgoAwQT8a3La3D1IoohDD6Drbltnr3gYE+nshbdwnoifWL4tx1WGZG
 7PL3DTqbo0CFdVXmLtGyp4wBNgBaBnpEStw46I8UreLiuXsjo/6pmWb31UJUVxhxf3PdGpapVnl
 g7Fnjhv4I71w9LggzHbxD0Rtg5JuQ+v6PJYTDVqUEWqILl5fp4W6Fb7w0SQwquUThVehFxTvP/m
 S+SG0TibRd4oWzPeaADjw9rssrqTaMsI8OulJRXT+NY/tw2p7E5SQMpehIJ/xATBNB7cXtLMo6E
 R7I0mLj4V5oVX0f8mYQ==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b071876 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=OBTfIaPFV1-Q2Zl7jqIA:9
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250068

Teach the LPASS RX macro driver about LPASS_CODEC_VERSION_2_9 (the
version reported by Glymur's RX macro) and add the matching
qcom,glymur-lpass-rx-macro and qcom,glymur-lpass-tx-macro
compatibles to the existing rx-macro / tx-macro bindings.

Based on linux-next (next-20261125). Tested on Glymur-CRD and
mahua-t14s.

Srinivas Kandagatla (2):
  ASoC: codecs: lpass-rx-macro: handle LPASS_CODEC_VERSION_2_9
  ASoC: dt-bindings: qcom: Add Glymur LPASS macro codecs

 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml         | 1 +
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml         | 1 +
 sound/soc/codecs/lpass-rx-macro.c                              | 3 +++
 3 files changed, 5 insertions(+)


base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
-- 
2.53.0

