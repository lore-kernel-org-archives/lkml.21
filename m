Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364116;
	b=MDmx/mCHWtIu0EgkAM6SoOXM9QJzfm6kNTN1ThqT3oknTQvzTd40pnbnuPnQR3+Sk4+r
	 QNMym/pk2kg3kuNWfNlwsXWb5YHqwv1sPmPoKEugMPqBV8al2fR7f4g7HiOPbo6hh9HaC
	 iNjwOncTYCpS4UsDWYoWP8SB00GBF53TU3/mSptXms0HryScwu6WPyBnyeF8i2ioMQbl8
	 0XFepe3R57LGb+dxTqPnikow9mAsZrfoTtziYX7qmkHlG7ctNXt4jfp+xp+4QxXfe2oQi
	 haS9VLxiae2rAbpsUrr2+8/5RnrG/rcoCLGoQcK3gZKEMnxxiYG49tX5/SDTKkzs3Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xe9mNmGNVrgK7uWOt7PejiC56UqOuv9iVTxY26r7kf8=;
	b=fb+oqXOAIjADThfFBsatca7lJCi8spZfrxgUMfNBnl7PuhKMCqm72F4NYA/eBWeB3Kmx
	 YQAScVqtkmVqqnRzREDW0vBINWDhkyTF/AsNnQk+wYLHf7gXKxQi3N6I7exQWmrnB2UW5
	 rId6y4snTmNlQJTmdVqWmITY3Xzu8Up4rTIAP0PNzPKzPpQZpuvzUeFXFjEni0SD//Le5
	 /D5TBAH9YP5EgqGcrKTHhBYj14qHqJaSinYrGINYABAteovUuC4VpK/EY5K/uBCYuzlh4
	 YbQqyZRwvERmNM6w3H6GsnLo9YfNSo2GcIKKC4nTYur8jKhBOtKfOZV07162a14Qt/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lD2kb50o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAUmqffo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC76606C56B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC76606C56B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lD2kb50o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAUmqffo
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQqjl280643
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xe9mNmGNVrg
	K7uWOt7PejiC56UqOuv9iVTxY26r7kf8=; b=lD2kb50o/CmUvZAkZUGmaOPR3zo
	ugh1ulOK+h8IWxdZXdl0ashI6+BSpcTNTwSWI7feOjbpnoP91r1f/o+wsi+CM7mn
	tPDKbNW1DhhAS72Eef6FaXlBgVvLep+oKtABMlfYXQI4WwQPmB4EmryCr5eEtgQD
	zBcsKE347dusT/KJx8ljOHmTL39ZvHMLA3p4Raupu7WkDBUDlCvEQXlEVGNoYk7m
	tSGoiaCprWWD6oQzm48yNbULcM+8p/XUW2bpqnmkWeL7fjVCkiFgqho4mOpyKqPC
	zc//MgbCt8Oc6prp+p9hCaeL71YKZlVIldTRI5N2Wnl0xLaTl3InBqrNDDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6ktfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:15:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9493e89d4f9so378513285a.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364115; x=1795968915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xe9mNmGNVrgK7uWOt7PejiC56UqOuv9iVTxY26r7kf8=;
        b=PAUmqffozjd6kpMEtcqqtil4WserDjEBG4hsfIbq7RQN8wPEvs2dgCeBZoCQiSoP5U
         KaVw9jlPN6HxMmMVO17AbTxSpb4+mES2gl7pdAA6EzogZhKhJLxHmpLpWcWcoaMmVA2I
         nRulq6tNJoda0RuENDR1HWj7ABkWdHOJprqxXvGtdMYduJrk6livbs+G3GbjOSY8xPE2
         +zux9KallTW8izr9H0wC4zM1Id1AYjgPjfKl0EEFjlMDLNAQSIF+SiSQgKfJ3mZRMtL8
         CUMWuZ/CLRk9UcSE5NuoKw2A6QSVdvua+8zRmwdDAtrLJspvN1LlZaeCajEUtPqj5acn
         3Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364115; x=1795968915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xe9mNmGNVrgK7uWOt7PejiC56UqOuv9iVTxY26r7kf8=;
        b=b+1l82WD2DktYAzQq+g1ZpYMgkz/DE4aYKzwWbwwmHyDzwa5AuWKYN2WhMkxnOmnMH
         Ye8ePnsmCv8I4XLOuuMByUsG8dsnKyPkcv9rRjyXRk6eY6u5yZTzO1WEsBf6LnxX3PM0
         yQlsUONJYzaJqOvwPmQROuv0io8k7+jtVjeH1ZK3LbQbbkcXPkVWRiiYZFr3Rbx37a3s
         34AtSEudkMrEqt9H9ayQZLdzuTmBlhVCZDmM76+r1rsZBeGe12a3BqQyMtZ5qAyLdIyw
         dsX96RrFTLMVX40cKH26m5nns8FhHQVUi3SjM1pcWd7C7IHvMdNXp6qRrwecLaaPfXSz
         hPAQ==
X-Forwarded-Encrypted: i=1; AL+hErEDGPJNTIrKCNbYYPk5q6nanMF0B5VbXg04Gv/56D71FnA6m7tTq8KaZljOuMN34ONPPR+aK4AksE5YJGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z86YGWdV2i6+jo+7jd8uTSfTONLyqMq61ASj4MALqYB2OtTaBIV
	l8ufNWnjWDR6ABVgRwODtW3X8Pkgxy3G2guK2pZO8rmriZk1vGUdi3YnFAT2hZovZv59mfZ5vTe
	0OFk0lGPSvjr7kYJx3IREshc3g909IIVsgxV/R7tSiMkueg72CffnoFtAcQvkROQc6EI=
X-Gm-Gg: AZFdTZeumshumsMFB2fsnyZ6yTEF5XQTa+e2o47ha0Zq+DoeRCmS+DARdA9hSegByLX
	SM90qagpSFS8cTs5O8it4lD2SiPgpZy0Dirz3C12KzKTgMT+FLbHNJIR6QAWxVKCc8m8Ec8WZ13
	cvvsHUKdNa0DBxcoq9xFyqc54F0huHHVqoOqPul8OOzhWME0ikko1cEJFDDuiEUEy1+sI9//+x1
	jIoCdzYf6tiRlAJ1KEjnvup+OJ0XN/EUH47eXBDQZaq11l3yFxw3yKGxGzXRcJNxL0dCwbJwnjR
	MroQEgLMABqSoorRZUTn1DBhkpK6dFYtdboonUQlIDa4pU+T0nhgnziGJBD26+6Qbxot1zR4Smv
	Q3gNy+1APS0YL/kYoXh7T0dH3ZvUrAHpCQC6ErML/MTms1k3o48WUFLdsaNdo48wn
X-Received: by 2002:a05:620a:2844:b0:943:b019:f011 with SMTP id af79cd13be357-949ba9b3e47mr1619402685a.28.1795364114650;
        Sun, 22 Nov 2026 08:15:14 -0800 (PST)
X-Received: by 2002:a05:620a:2844:b0:943:b019:f011 with SMTP id af79cd13be357-949ba9b3e47mr1619396085a.28.1795364114124;
        Sun, 22 Nov 2026 08:15:14 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:13 -0800 (PST)
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
Subject: [PATCH v2 16/24] ASoC: qcom: audioreach: add speaker protection mixer controls
Date: Sun, 22 Nov 2026 16:14:29 +0000
Message-ID: <20261122161437.5994-17-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: n6NZEuouNA6KMP-t_-Iu1UDjTI7voAIn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX8jgKmhx4+abz
 0rVndzKgJfqIgnn6iN0vRyWzA6iOEMk133zGxSr6pURTpWSlCMdnZzjel/vSoXtHHdnOyQmYrI4
 lVAWyl+BD5Ay0iKrXd+GunbJI7hwUng=
X-Proofpoint-ORIG-GUID: n6NZEuouNA6KMP-t_-Iu1UDjTI7voAIn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXwr37/L/9m9S4
 BB1l7av6oUzhzsrOukG1Jubklgw07DSkLLwicViuUnMJ85OYiF2MKMAAXRXY3dCJRBr8zFj0B7l
 LcKUx5UtT3pt2mSaWGNDfa5BGZeqzR89bh8vyx+4wy+LgUBf7AU7gSp+asZL7NBG/1FCGjt/Os3
 yi+Tz7I22NrVE2mzwsyeJWMx4rVNrLjyKeu7NkWLhoNzDytgvWbXfQpu3UQ/arsHNzTpwutjZEY
 2Jm/dp3gSmi4iYdDxmXnxB4A6kEgPzFSyNZPuNi+B83DSCfFI45egoJ4P1fbnNDZj1anMO8BLS6
 9eWyBI2atguKtj8AzevLI+fMpMM47CUIEoX+Zqb1Fa3PQxO5WqQcVb47lMr3OvXDK1lv9IFn5hL
 7Wflc98DEE3RsozMfkoK2SYNG8KpnEqOuMmycBochMzWRHb9bQl9G7nWiGJXyIloPf8P1s9WJG4
 /nT5CNwdzon0YASNC9A==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b031513 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=z7hZsS5TAAAA:8 a=U_FWf4IRJOzsE_kR7ycA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Qe1wxHrAD-1Q-kOd8w1m:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add topology mixer controls for the operation mode and the per-speaker
R0/T0 pairs, so userspace can run a calibration and restore its result.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h |  2 +
 sound/soc/qcom/qdsp6/topology.c    | 75 ++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 7ab8e11ca5c2..db62dc7f9c8a 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -57,6 +57,8 @@ enum ar_event_types {
  */
 #define SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX	256
 #define SND_SOC_AR_TPLG_VOL_CTL			257
+#define SND_SOC_AR_TPLG_SP_OP_MODE_CTL		258
+#define SND_SOC_AR_TPLG_SP_R0T0_CTL		259
 
 /*
  * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:		Sub Graph Instance Id
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 5dd7f2c51d5c..c07a27bdd3a2 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1465,6 +1465,68 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+static int audioreach_get_sp_op_mode(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.enumerated.item[0] = audioreach_get_sp_operation_mode();
+
+	return 0;
+}
+
+/*
+ * "Speaker Protection Operation Mode" is read-only status.  Enter
+ * Calibration via the "Speaker Protection Calibrate" trigger instead,
+ * so a stale alsactl state file cannot flip the DSP into Calibration
+ * and nothing can leave the system stuck there.
+ */
+static int audioreach_put_sp_op_mode(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	return -EACCES;
+}
+
+/* One R0/T0 pair per speaker, written as a whole set */
+#define AR_SP_R0T0_CTL_COUNT	(MAX_SP_VI_SPEAKERS * 2)
+
+static int audioreach_info_sp_r0t0(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = AR_SP_R0T0_CTL_COUNT;
+	uinfo->value.integer.min = S32_MIN;
+	uinfo->value.integer.max = S32_MAX;
+
+	return 0;
+}
+
+static int audioreach_get_sp_r0t0(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	audioreach_get_sp_vi_r0t0(ucontrol->value.integer.value,
+				  AR_SP_R0T0_CTL_COUNT);
+
+	return 0;
+}
+
+static int audioreach_put_sp_r0t0(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *scomp = snd_kcontrol_chip(kcontrol);
+	long cur[AR_SP_R0T0_CTL_COUNT];
+	int ret;
+
+	audioreach_get_sp_vi_r0t0(cur, AR_SP_R0T0_CTL_COUNT);
+	if (!memcmp(cur, ucontrol->value.integer.value, sizeof(cur)))
+		return 0;
+
+	ret = audioreach_set_sp_vi_r0t0(scomp->dev, ucontrol->value.integer.value,
+					AR_SP_R0T0_CTL_COUNT);
+	if (ret < 0)
+		return ret;
+
+	return 1;
+}
+
 static int audioreach_control_load_mix(struct snd_soc_component *scomp,
 				       struct snd_ar_control *scontrol,
 				       struct snd_kcontrol_new *kc,
@@ -1505,6 +1567,7 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_ar_control *scontrol;
 	struct soc_mixer_control *sm;
+	struct soc_enum *se;
 	struct snd_soc_dobj *dobj;
 	int ret = 0;
 
@@ -1524,6 +1587,14 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 		sm = (struct soc_mixer_control *)kc->private_value;
 		dobj = &sm->dobj;
 		break;
+	case SND_SOC_AR_TPLG_SP_R0T0_CTL:
+		sm = (struct soc_mixer_control *)kc->private_value;
+		dobj = &sm->dobj;
+		break;
+	case SND_SOC_AR_TPLG_SP_OP_MODE_CTL:
+		se = (struct soc_enum *)kc->private_value;
+		dobj = &se->dobj;
+		break;
 	default:
 		dev_warn(scomp->dev, "control type not supported %d:%d:%d\n",
 			 hdr->ops.get, hdr->ops.put, hdr->ops.info);
@@ -1550,6 +1621,10 @@ static const struct snd_soc_tplg_kcontrol_ops audioreach_io_ops[] = {
 		audioreach_put_audio_mixer, snd_soc_info_volsw},
 	{SND_SOC_AR_TPLG_VOL_CTL, audioreach_get_vol_ctrl_audio_mixer,
 		audioreach_put_vol_ctrl_audio_mixer, snd_soc_info_volsw},
+	{SND_SOC_AR_TPLG_SP_OP_MODE_CTL, audioreach_get_sp_op_mode,
+		audioreach_put_sp_op_mode, snd_soc_info_enum_double},
+	{SND_SOC_AR_TPLG_SP_R0T0_CTL, audioreach_get_sp_r0t0,
+		audioreach_put_sp_r0t0, audioreach_info_sp_r0t0},
 };
 
 static const struct snd_soc_tplg_ops audioreach_tplg_ops = {
-- 
2.53.0

