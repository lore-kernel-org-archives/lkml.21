Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794946;
	b=EG4xoxvxFTBkLpZICSACzV90K8448UuQmari4YEKOko2X/IgyhsU/U/jp04ksJxlrXwI
	 t48nY548QCBpbybKAIQoP61gwcCHfTfTBCCn5HHpOPNCXywy4tvaVuT0HyHKFtuH2EXXx
	 fSrT6v58bX8eXEspxuUHcXfycz5vKV4n2Ug/36H/v4lVVybJ6TssIz0aHYfAeFOYUG160
	 4FyLviE/iXx7BJYi3WBmjvOVxMZ084D9vsg9kwpCumrvmjK66pZPVdmDcD8gwYbpFo3Bh
	 aRyN8ZaxlsPwxUgS1OuAogCLZwhBEIFolbVcgUf8VjvVnYGWgSHwpw4Z5tmlDYZXdsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6nyF58dcnncG871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=;
	b=yZFqgzAnW9PjYRHcKx/gV/Kv53bqSy7Z9zl7ejYrKJLoNtGgyh0c1f8jnVtn/BXjumIM
	 rK3XZ6urI4YM+LAv0CLinjBruyw5u5IDDj90cjUnnVR5Y7b1kE5sBkxwEKsIRdO2HhGe5
	 8tD1PKigj7JWuHNFCF4eMqCeydag/EXfwCTz+RCeG4lmHoY2zHyod6AXTCjjKYt+0Rua2
	 OIOYeYl84tmUH+8dq9BhrlvgpLEOPKh/2antXpTwfXhZ0Btc5iDzUXi+EwxldmM4qUT2V
	 NFPduyv37Knq136dkouG0cKK/otJM5e6FyxbMZAmQ37z4sa8jRfjBygwAgNKgQm4Q4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FgOdbpEA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c792ZMJB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CC6606A6A4
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90CC6606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FgOdbpEA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c792ZMJB
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFosg41703511
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6nyF58dcnnc
	G871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=; b=FgOdbpEAl4pSbM/oCGkEbnfIitB
	55t+tnJUQD5EVgsFAXej27PiwYSRVZLuooqN61csqVFG+rMwl6WZcEmWsaO0PKPa
	+Xnc6RAjX4MuBF7oUI0iPATbsa2Bnb7VhEWuBpabAWHzZJKJl+QpeDDuwLU1lj7c
	1OG8KLvHrlQ4iPgIGUSdl8+QwWtNB4doTGsFoCRX4mRO/2l2E5z3RW85A2UotPK5
	2Yorazn/srVpTQfTcLjLOcC3aPuSubpeiFzyomCWyVwcVW5eXutTHk8A8bEn+ZBI
	2wu/OLrE0jJx/5jv9nWetzst1UHp9QJBUDykKLvAyg6p3DuI/jP03KCkYHg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqmp69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:44 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-679f81d5d7bso13240779d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794944; x=1796399744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6nyF58dcnncG871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=;
        b=c792ZMJB1D5ap0q4lFgOnCh6W7yRQ0uPAdzcZJK6jFY+ATIHFt0T0Ckw3PnBg3wDJi
         EkfwJkrVItswTbZPwEKRzSI2re/g2D0rc/2oVJJS7/gHYJdiuJuPC9/rZffp8NLEGPR+
         +Jv1FAoo46HSAt05PLHTkTGp3CXIgP9/UBGv3RlT/3AfEp0d7X52gVJIC+sNvZJvUovM
         97Nf5inoPzvgMD8U3fYDDq/HP+81JbSpK8QPV4GTzsrGhTd0XZQQpr4lrAgYKCauHoOi
         NP7hu+K0mkjjummfv9bxqY1RQEJ5F+aT3V+SLe6r3n9xCp2OLvlYIkdRezvecMeSpR3T
         ub4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794944; x=1796399744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6nyF58dcnncG871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=;
        b=0j4/Oz8Gw7+7r4pE4F0ahbobsrQOzbGXiJCifsqamtgTVpyQlhCKMrcQPB1cUenn8I
         VqljgtvdM/jkWPdczaEnKVkrwCDs1t6VFS6rsqA0YaSqfxmPzJk8D3CV0xCqqmYQD+A2
         h29nCfSdkBeQQUksp8z25wI7lhpo2xQ679c/NTi3EPVL/6zlaKZhH1ksmPSUrJERn2q2
         eSlfLds4EM848Ouc8QqoyzHDCOex8Xkm8DR8aB4Jn1YKarrZEA/UQOiflXzNvqU2SVS+
         k1/GWTJQr72X7fZexY/H5Kj412vWD900sqcgEEv7AYW6HfTksz+5lG6TbFVCBPyL5fnb
         pxUg==
X-Forwarded-Encrypted: i=1; AL+hErGfdxF1KIVmTiMUN3xF7ji46DMNfMnqz0isy76D8AsC6LV1BBG5is6se7AM7dNr0wd1vz2cn5Jgc2l6UYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EJTXz07nQvdXFg1Paj8ZhzwHOv6XYwjH4B8tmP9y5GME1Fs4U
	2yXqeHvrad+ISryOc5taoOKXdeMnd52I8nq5OgKp7Cj0+ukEkfsD6h5tj7TCUT3Gzv1GxOSVZf0
	Cij0Z0sWMFsMRNXhI5rgBEHiCzFUxk75Hj6avc2lRlKrHb8NUvJPA2rVkOwIC7kh0u0Y=
X-Gm-Gg: AZFdTZffBmOqb+WxeBAiX6p3/FYWDcCFla39dFta2wfhi2r1of7P1X79lzfFkdHj2Kj
	THOLy1r9IDl0OSy+jkKAZ8Vhzr9Pbzxzx2Z1/X87NnHlaP4zic+u69r2pXh80PE1rT7VyqmWXr2
	xjGu25JMPj5HZjA1YpGumJ9fEtLkCPVtgsh4gDt9i6biKnB7Nmfd2XQSuAaPqxLkdcHOF2LxmLA
	UDEZprCMuGBXU9CLUMQr3ybt73I/xxer7DXE/OLe8iT5syiAh/273a+hpCOxYoeULGgHiu8ug9p
	y5fGZooLm6wDhnuOoBFzbxLCoG7Kp7niy7hAL+4QO8A4qrCPYTBZM4hhPpt/X6Geg32enRTk1sY
	vDlD85VN5VEKgVh/pJfckHeCZHZ0BZYALGdC5omcHXG+PnA1WaAY0iOkeccB2ffLY
X-Received: by 2002:a05:690e:130c:b0:674:1fdd:6116 with SMTP id 956f58d0204a3-67df445e102mr8628421d50.100.1795794943678;
        Fri, 27 Nov 2026 07:55:43 -0800 (PST)
X-Received: by 2002:a05:690e:130c:b0:674:1fdd:6116 with SMTP id 956f58d0204a3-67df445e102mr8628411d50.100.1795794943270;
        Fri, 27 Nov 2026 07:55:43 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:42 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 7/7] arm64: defconfig: enable SDCA class driver and WCD9378 codec
Date: Fri, 27 Nov 2026 15:55:20 +0000
Message-ID: <20261127155520.358909-8-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: nSgb92_TtwImClE-DUIaMXdtT3Rq-wss
X-Proofpoint-ORIG-GUID: nSgb92_TtwImClE-DUIaMXdtT3Rq-wss
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b09a800 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Lb-CJUeqFN5ILZ2-pT8A:9 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX3LfFo2VtUABW
 AGbm2cbAU/W/M06e4UKbXDmeQpxamp9dEQqaNlUr6iis7EVu9ygAYXoaBxLd+A15KBSZoquktAl
 Bb2LJELC/ylacnUu+q/bv1BAIZYxgyM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX5uLMsWOzwVoP
 BcBaJYn1phbB/UbKTHvbel/ET6Iuy43I5/G+M7gh0niO+RdUEEy+3QCU0RTuCyb1ohixeodaCcI
 QKwflqhAKEvtZurVmIZQA4zToOC+qXOP38/RygAkWtA+99lLXPUZ1bup0TzKZkqcgglOA5NFttl
 RvDh1JgbhkwMywI8AqxqS7zN3+Cg2jwciTgj6mjiPPrpb4kIBMpccENll5A4Ab8fAyhft90Mas1
 FVk6YBoQP0EmaDUEzLC9Eum0TkP2fz8zDtz6dPyQcVu5/cvSCjoF8l80T5oNuUvRLxVgbd/48AW
 CI6ZC0aQHWw1pg8jCZWcSzgJvkEjGTnEm8bmnLRubpVg1qEmDTPD6mCXSD4jC/0+N4wls1ih+1v
 Z1Bux6MLNGfPJOxIVRdPuUjnDzMRHXpPpaCl91B/0FERWoW/eZVFzxv60KJbbVvtwe5Oi94V44C
 k6v+a3kC+dQ62o9XTIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable CONFIG_SND_SOC_SDCA, CONFIG_SND_SOC_SDCA_CLASS and
CONFIG_SND_SOC_WCD9378_SDCA so Qualcomm Glymur-based laptops such as
the Qualcomm Glymur CRD, the Lenovo ThinkPad T14s Gen 7 and the ASUS
Zenbook A16 have working headset audio out of the box.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a22..86b33019eaa0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1184,6 +1184,8 @@ CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
 CONFIG_SND_SOC_RT5659=m
+CONFIG_SND_SOC_SDCA=m
+CONFIG_SND_SOC_SDCA_CLASS=m
 CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
 CONFIG_SND_SOC_SIMPLE_MUX=m
 CONFIG_SND_SOC_TAS2552=m
@@ -1194,6 +1196,7 @@ CONFIG_SND_SOC_WCD9335=m
 CONFIG_SND_SOC_WCD934X=m
 CONFIG_SND_SOC_WCD937X_SDW=m
 CONFIG_SND_SOC_WCD939X_SDW=m
+CONFIG_SND_SOC_WCD9378_SDCA=m
 CONFIG_SND_SOC_WM8524=m
 CONFIG_SND_SOC_WM8904=m
 CONFIG_SND_SOC_WM8960=m
-- 
2.53.0

