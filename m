Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364114;
	b=qqOUSmyJCJGjdnuBZzXuwnhcBKKXOMWJVelOpBFzucrJMs1wZi9WHadIQ3s+r9I8gAk8
	 khwjwfCU9oRJd3Zy1rcCh6/UfMNJk+kX1I6jrNAD7ZIeDnu/BN373pGcybr0iJop8pT7a
	 lNjwSF7juzbCR9hKoOgRPuQ7s7iRABYXX2h/aNpcI6coRbfEZDk5f2HxEGPgHHKt/+YdK
	 rcLTsY//tQxJkuwhTFGUUpOKGx8kpravQNlLMSFK2lhOMkkJiXPRQXcppWFI2kTHHLtET
	 iaCKdrzIlFifoSTMzrigra+IlS7D1S9rdLRchO3sRcX3pKRFXhFsk3zyjkK4FZ1vnKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364114;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+Q8qUtSElpaUrwDF3ZY4DFxtYXTDDiIMIOq8folYzT4=;
	b=M6/jccFXwZURZaf2VPmMRzBJ6wvRxQpMz+AlAoZoqinjueIpsR8/N4aX8X4HLlvrG45z
	 cQMjZMKo3Evtr+Q/KT3QAcJYIcSgLUnCae2qpykw4RcbXeeS+SGw+maghPhTiCmOlAq5u
	 upV54Mwz4b9Foqn3k7vNJ8q/JFmaK/yVEV01+ihgAFTixC0/PCZbFrMYKYD7cWE3HcjJ3
	 7SZdvZ7AApodIyov8MfTJZoVSvkqiHHdPtZJoQUBGnwZjnwRNqDXrj6Tjl6QftUNw+myT
	 7KjlxiaCta2j83juLI+RpgCruDWHICECgyz6YpF2+ikpIiTsDfL67r/1Vzik74oT7Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P3giBkMq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="UjlQ/tEe";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DFE60A6F5F
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89DFE60A6F5F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P3giBkMq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UjlQ/tEe
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQbjL1855194
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+Q8qUtSElpa
	UrwDF3ZY4DFxtYXTDDiIMIOq8folYzT4=; b=P3giBkMqLtZ8RbWMMxIacIfYWCa
	JMA1tLjmrOFV+uTuO6tB1z7ly27g1hgBvwlfYC713RpDJckGKYouG7N6fA+E2upV
	/uPa0TwwmWiGHK+lTOhUmIPK5LLrGJjHA2Sv5ksOeUHL6vz1j/2bUgrtRs9M+S3Q
	IhSJT6pdO9aE1pkTXRqauT7AqihR/RyiekP15zuDuvvzewLRxgoTjPoOqnq5dH5N
	2wfr9fkhDsmYduSj00h5aSgs1kih857VbhhqDe0HFoCPyeJULjWQTlo57lVWLG8h
	/Pfr1hmK76rqIoi0XjfdikLRIAk6AoSdVirMNBgyOWVZSQwMRGaH4hjdrGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv41b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d322fcso469588185a.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364112; x=1795968912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Q8qUtSElpaUrwDF3ZY4DFxtYXTDDiIMIOq8folYzT4=;
        b=UjlQ/tEeVO+Y+WvJ10L4PJStcA0vmf+4SSIb+9tjCpn4UyUB+vnSmrgRK3NndDEGue
         Omh87DiydA7FD8qZYxKIP4LWWqRWDA4oMPCKKcBq0WbYlVq3ogehN3+paU9DSdi7p3tv
         Lyp9+uwtdS5nf0HUVlB92CDiLh8OJ58gFgGVWfCXCpyUGoat+Dql29/RRmMuc3qTcV/+
         XAPrTSkeg8bXPyil2qhrRAtBLTYt6ghfk7dFvpBhoc0/DBXmGhCG4iUbdIV/uwjQ6Dzy
         3THQrQYyPLRZtRqGNtPoC57wXrQNH2ZrBKm9VK1nEdqBuU4rD2gXiBLY3fAIAGtePWc1
         JzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364112; x=1795968912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Q8qUtSElpaUrwDF3ZY4DFxtYXTDDiIMIOq8folYzT4=;
        b=YfH3cx+cSqJxRfITBSvAlRZ11ze9z0QMaF47owfcFwd6SrpYGmXb0nO8Z+rVwZa/Yv
         ZnK9VkQMGboP27USijjSbFHeNPNgKg/FyCCM8sFVshYwELvh+Udv9umcnPHol1i2kYp4
         GUIqTDFrQHbDGFpPCqy3jSjTkhAlqMAb+0lFboQh/CGPfdwGppKVhj4zyrMJyKmwal+b
         80jODwjQi1jHuFFEfc2eYZSSu+2teBjU2DqDVgbXUbGU9y41m/4U0l8qjyvSobYvwxZ7
         4s2i5dEYJawt8Rd5GvrrMzPgEoJTMBP0SHkoNrEbf4iybzVdEeRHyVCjEISjh6YtdUZf
         GjTQ==
X-Forwarded-Encrypted: i=1; AL+hErFhGZ/0/jRiGU2Lq16ArnQM5LfrNrdi/lfhu8mT54BK5JFP88MHRcDRgj69vg7PUC6AuRrvU5IcH7S1Zgg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qCYXGF1xr64CqIJCOesLCJC81fNRUkX54Gxc6I3w3MD6/krUF
	a7+sSGy5ydqJV5UPXTxgHe6l1qI8iViIafz/hancgfHrPUIPdqYK6O1qj7HUaCc6ebBeHsnU8eI
	8pbprJ71CZiZMRbvWoppUfIvWx3DF899jbK6zMi8q2UgykT73STHN/RZQ37KkrglDZ+U=
X-Gm-Gg: AZFdTZcAgFjjHcOS93oxT1Ls2u+lJGToPv8ir9HLQDzVKv5u9ERmRa6oKGi7e2VDIZE
	SjCyALrHxJphzL6o10jelNB24/190khvaHZcX0OjnWCdq2/4W4MITxCPwhqeUdBKFs/s3yE1+QU
	lZcgdkM96+KLzOJ6FjkOgBaRWHUhGo2gMs96EpLsLAlu45NJZDo21a+LbZcHQCxVvb+INKQNctW
	xQosZ9Deg1EgBdWwOeaaMGVtENcnvWN8X5cUHNPOHrbsGB5hNzgmmzWIWEgCDFfqQpk2LIJWnbo
	ia89qsXtk6u6TIv9YDivV/InNkNs7aO6a58u4nFTLMDjYCN2Jzx7niZvQrjdshCNOuaJ12L1Kdt
	b651h8+fqBKfIFsa/EPNKXhwfUtCuazO6N42K5wGP75y9GJbyqjpAlsxr4PQu5vPI
X-Received: by 2002:a05:620a:4008:b0:949:72f0:cc12 with SMTP id af79cd13be357-949baa151a2mr1729089085a.64.1795364111647;
        Sun, 22 Nov 2026 08:15:11 -0800 (PST)
X-Received: by 2002:a05:620a:4008:b0:949:72f0:cc12 with SMTP id af79cd13be357-949baa151a2mr1729081185a.64.1795364111088;
        Sun, 22 Nov 2026 08:15:11 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:10 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 14/24] ASoC: qcom: audioreach: send cached R0/T0 to the VI module in normal mode
Date: Sun, 22 Nov 2026 16:14:27 +0000
Message-ID: <20261122161437.5994-15-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX7TAuKhShnlsm
 JsrerE4k7ZrwsUL6ZqiTD0axCE8UyoN0t/W1K+lPSxCd2tcL9PJdEvvid3jaOTlvb9V8T42RFLZ
 zPwqmy86h1YLljcXBOcJLz2UCA5CyyhhmIsfUMopzDmvCPgz46SHOs6ip5dOQPTPWXjF0aRTQQ8
 5SSKEKfN7CzERMMhqBUBebn+PrMayLtumeTZ4illUuZrbfjt/o0tM/OCzIKwGiECVwvg0EJixxm
 OAcjaXXcBl7oF5N1pWRCOw7JWj1hUjPaYrvKSNP0m36RevxciKJ8OotxHhQElXfSWBkwG8ou+r0
 4B9CVRtKxftliF/O96meCH5WrQGD9yXafweSjGaRhRXS7qLUe0i41GO4lJSmsWG5MPS31eWFZoK
 0B20uZVL7gGrTG6ZtceOsI1vJCVBGr2zlWP4biBM6bOWjfgVEUMBQsuGctCPk/6FcG7pXtMJYBN
 fwJRr6LYr+mYH7H6L/w==
X-Proofpoint-ORIG-GUID: kpBpT5Z7ik420GN5vajQ6_UTkB2D5_Tk
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b031510 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=AMPNuP1iUC2PUEDpgJ8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX37CCG2/w9R6A
 oaxyoe924yP9Jn5+QXIsFDNRyf3ZbnOTlqohO+lsMHOQm2riP1dFMQecy2z1xqE9pNFYB8fpHlw
 t/z5po/7rbeWNRUJMwV53H6czzSwnE8=
X-Proofpoint-GUID: kpBpT5Z7ik420GN5vajQ6_UTkB2D5_Tk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

In normal mode the VI module needs each speaker's calibrated resistance
and temperature, otherwise thermal protection has no reference.

Send the stored values with PARAM_ID_SP_TH_VI_R0T0_CFG in normal mode
and store the result of each successful calibration. Values written
from userspace are range checked, and a graph whose speaker count does
not match the stored set is refused instead of being partly configured.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 170 ++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  21 ++++
 2 files changed, 191 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 130298a28749..070100627809 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -35,6 +35,15 @@ struct sp_vi_r0_result {
 static struct sp_vi_r0_result sp_vi_r0;
 static DEFINE_MUTEX(sp_vi_r0_lock);
 
+struct sp_vi_r0t0_cfg {
+	u32 num_ch;
+	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
+	s16 t0_cali_q6[MAX_SP_VI_SPEAKERS];
+};
+
+static struct sp_vi_r0t0_cfg sp_vi_r0t0_cfg;
+static DEFINE_MUTEX(sp_vi_r0t0_cfg_lock);
+
 /* SubGraph Config */
 struct apm_sub_graph_data {
 	struct apm_sub_graph_cfg sub_graph_cfg;
@@ -285,6 +294,15 @@ struct apm_module_sp_vi_channel_map_cfg {
 				sizeof(struct apm_module_sp_vi_channel_map_cfg) + \
 				(ch) * sizeof(uint32_t), 8)
 
+struct apm_module_sp_th_vi_r0t0_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_sp_th_vi_r0t0_cfg cfg;
+} __packed;
+
+#define APM_SP_TH_VI_R0T0_CFG_PSIZE(ch) ALIGN( \
+				sizeof(struct apm_module_sp_th_vi_r0t0_cfg) + \
+				(ch) * sizeof(struct vi_r0t0_cfg), 8)
+
 static void *__audioreach_alloc_pkt(int payload_size, uint32_t opcode, uint32_t token,
 				    uint32_t src_port, uint32_t dest_port, bool has_cmd_hdr)
 {
@@ -1568,6 +1586,86 @@ static int sp_vi_q24_to_int_frac(s32 val, int *frac)
 	return val >> 24;
 }
 
+#define SP_VI_R0_MIN_Q24	(1 << 22)		/* 0.25 ohm */
+#define SP_VI_R0_MAX_Q24	(64 << 24)		/* 64 ohms */
+
+#define SP_VI_T0_MIN_Q6		(-30 * 64)
+#define SP_VI_T0_MAX_Q6		(80 * 64)
+
+void audioreach_get_sp_vi_r0t0(long *vals, unsigned int count)
+{
+	unsigned int i;
+
+	memset(vals, 0, count * sizeof(*vals));
+
+	guard(mutex)(&sp_vi_r0t0_cfg_lock);
+	for (i = 0; i < sp_vi_r0t0_cfg.num_ch && 2 * i + 1 < count; i++) {
+		vals[2 * i] = sp_vi_r0t0_cfg.r0_cali_q24[i];
+		vals[2 * i + 1] = sp_vi_r0t0_cfg.t0_cali_q6[i];
+	}
+}
+
+int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count)
+{
+	struct sp_vi_r0t0_cfg new = {};
+	unsigned int i, num_ch;
+
+	/* One R0 and one T0 per channel, so an odd count cannot be complete. */
+	if (!count || count % 2)
+		return -EINVAL;
+
+	num_ch = min(count / 2, (unsigned int)MAX_SP_VI_SPEAKERS);
+
+	/* A trailing all-zero pair is padding, as zero is not a plausible R0 */
+	while (num_ch && !vals[2 * (num_ch - 1)] && !vals[2 * (num_ch - 1) + 1])
+		num_ch--;
+
+	if (!num_ch) {
+		dev_err(dev, "SP R0T0 has no channels set\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_ch; i++) {
+		long r0 = vals[2 * i];
+		long t0 = vals[2 * i + 1];
+		int r0_int, r0_frac;
+
+		if (r0 < SP_VI_R0_MIN_Q24 || r0 > SP_VI_R0_MAX_Q24) {
+			r0_int = sp_vi_q24_to_int_frac(r0, &r0_frac);
+			dev_err(dev, "Channel %u R0 %d.%03d ohms (Q24 %ld) out of range\n",
+				i, r0_int, r0_frac, r0);
+			return -ERANGE;
+		}
+
+		if (t0 < SP_VI_T0_MIN_Q6 || t0 > SP_VI_T0_MAX_Q6) {
+			dev_err(dev, "Channel %u T0 %ld.%03ld degC (Q6 %ld) out of range\n",
+				i, t0 / 64, abs((t0 % 64) * 1000 / 64), t0);
+			return -ERANGE;
+		}
+
+		new.r0_cali_q24[i] = r0;
+		new.t0_cali_q6[i] = t0;
+	}
+	new.num_ch = num_ch;
+
+	guard(mutex)(&sp_vi_r0t0_cfg_lock);
+
+	sp_vi_r0t0_cfg = new;
+
+	for (i = 0; i < num_ch; i++) {
+		int r0_int, r0_frac;
+
+		r0_int = sp_vi_q24_to_int_frac(new.r0_cali_q24[i], &r0_frac);
+		dev_info(dev, "SP channel %u: R0 %d.%03d ohms (Q24 %d), T0 %d.%03d degC (Q6 %d)\n",
+			 i, r0_int, r0_frac, new.r0_cali_q24[i],
+			 new.t0_cali_q6[i] / 64,
+			 abs((new.t0_cali_q6[i] % 64) * 1000 / 64),
+			 new.t0_cali_q6[i]);
+	}
+
+	return num_ch;
+}
+
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch)
@@ -1632,6 +1730,14 @@ void audioreach_vi_calibration_event(struct device *dev,
 			 i, r0_int, r0_frac, sp_vi_r0.r0_cali_q24[i]);
 	}
 
+	/* Only a run where every speaker succeeded gives a usable R0/T0 set */
+	if (success) {
+		guard(mutex)(&sp_vi_r0t0_cfg_lock);
+		sp_vi_r0t0_cfg.num_ch = num_ch;
+		for (i = 0; i < num_ch; i++)
+			sp_vi_r0t0_cfg.r0_cali_q24[i] = cali->cali_param[i].r0_cali_q24;
+	}
+
 	dev_info(dev, "VI calibration complete: %s\n", success ? "success" : "failed");
 
 	/* Edge-triggered: the mode auto-returns to Normal on terminal state. */
@@ -1776,6 +1882,70 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 
 	kfree(pkt);
 
+	if (rc)
+		return rc;
+
+	if (sp_operation_mode == PARAM_ID_SP_VI_OP_MODE_NORMAL) {
+		struct apm_module_sp_th_vi_r0t0_cfg *r0t0_cfg;
+		int r0t0_sz;
+
+		guard(mutex)(&sp_vi_r0t0_cfg_lock);
+
+		if (!sp_vi_r0t0_cfg.num_ch)
+			return 0;
+
+		if (sp_vi_r0t0_cfg.num_ch != num_speakers) {
+			dev_err(graph->dev,
+				"SP R0T0 is for %u speakers, graph has %u\n",
+				sp_vi_r0t0_cfg.num_ch, num_speakers);
+			return -EINVAL;
+		}
+
+		r0t0_sz = APM_SP_TH_VI_R0T0_CFG_PSIZE(sp_vi_r0t0_cfg.num_ch);
+		pkt = audioreach_alloc_apm_cmd_pkt(r0t0_sz, APM_CMD_SET_CFG, 0);
+		if (IS_ERR(pkt))
+			return PTR_ERR(pkt);
+
+		p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+		r0t0_cfg = p;
+		param_data = &r0t0_cfg->param_data;
+		param_data->module_instance_id = module->instance_id;
+		param_data->error_code = 0;
+		param_data->param_id = PARAM_ID_SP_TH_VI_R0T0_CFG;
+		param_data->param_size = r0t0_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+		r0t0_cfg->cfg.num_ch = sp_vi_r0t0_cfg.num_ch;
+		for (i = 0; i < sp_vi_r0t0_cfg.num_ch; i++) {
+			r0t0_cfg->cfg.r0t0_cfg[i].r0_cali_q24 = sp_vi_r0t0_cfg.r0_cali_q24[i];
+			r0t0_cfg->cfg.r0t0_cfg[i].t0_cali_q6 = sp_vi_r0t0_cfg.t0_cali_q6[i];
+			r0t0_cfg->cfg.r0t0_cfg[i].reserved = 0;
+		}
+
+		rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+		kfree(pkt);
+
+		if (rc) {
+			dev_err(graph->dev, "SP activation failed: %d\n", rc);
+			return rc;
+		}
+
+		/* Protection is now active on the DSP */
+		dev_info(graph->dev, "SP active in Normal mode (%u channels)\n",
+			 sp_vi_r0t0_cfg.num_ch);
+		for (i = 0; i < sp_vi_r0t0_cfg.num_ch; i++) {
+			int r0_int, r0_frac;
+
+			r0_int = sp_vi_q24_to_int_frac(sp_vi_r0t0_cfg.r0_cali_q24[i], &r0_frac);
+			dev_info(graph->dev,
+				 "  SP ch%u: R0 %d.%03d ohms, T0 %d.%03d degC\n",
+				 i, r0_int, r0_frac,
+				 sp_vi_r0t0_cfg.t0_cali_q6[i] / 64,
+				 abs((sp_vi_r0t0_cfg.t0_cali_q6[i] % 64) * 1000 / 64));
+		}
+	}
+
 	return rc;
 }
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index baafd3bcd0c3..713bf3ba5b6f 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -722,6 +722,25 @@ struct param_id_sp_vi_channel_map_cfg {
 	uint32_t channel_mapping[];
 } __packed;
 
+#define PARAM_ID_SP_TH_VI_R0T0_CFG		0x080011f5
+
+/**
+ * struct vi_r0t0_cfg - Per-speaker calibrated R0/T0
+ * @r0_cali_q24: Calibrated DC resistance in ohms, Q24.
+ * @t0_cali_q6: Calibrated temperature in degrees C, Q6.
+ * @reserved: Padding, must be zero.
+ */
+struct vi_r0t0_cfg {
+	int32_t r0_cali_q24;
+	int16_t t0_cali_q6;
+	int16_t reserved;
+} __packed;
+
+struct param_id_sp_th_vi_r0t0_cfg {
+	uint32_t num_ch;
+	struct vi_r0t0_cfg r0t0_cfg[];
+} __packed;
+
 /* VI per-speaker calibration event, raised every frame in calibration mode */
 #define EVENT_ID_VI_PER_SPKR_CALIBRATION	0x08001511
 
@@ -1116,6 +1135,8 @@ int audioreach_send_u32_param(struct q6apm_graph *graph,
 			      uint32_t param_id, uint32_t param_val);
 u32 audioreach_get_sp_operation_mode(void);
 int audioreach_trigger_sp_calibration(void);
+void audioreach_get_sp_vi_r0t0(long *vals, unsigned int count);
+int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count);
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch);
-- 
2.53.0

