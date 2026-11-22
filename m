Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376493;
	b=jiY5gNg3g6C9fYOKtaubE5cUYMCu89kuM64VhsWsB4qbvFT3eALcMnsjmR9UpFTTRW/D
	 7IL2j8pMIb/BWFp0Ud9JUmgUoP9MGVFFm5G434QWDAPLa2Lt+/ARYte6V3NPjmVVLSYL/
	 kSpZMmkG1yS92hTKUgyd1w7ED8WiKNm1apaYS0BvD/rre0FWpq7q67uYTf8wW+JTeRpZo
	 RIyUFM9AMtqedVeAv6wsD5C/ixA9Z23mQWDQnwyyq4BvFVXKch+M5F3z+oOvPBnpQPQfQ
	 qc8CE4Y0lgHq9sNv77XZa+STcd/ejGJlN+MfVjq2A/UhZeynPa9CwOUVDzXrchH5gmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=;
	b=Tvp16NW2UUqYvQYChEyJaGl5BKOs93yCwz1mnAoZxRU2mwqG2qQsbrjsNz9Ur3en0Dx2
	 uvkW4Nb89qeM2ndI1XJA8YPybyOl1aEg0YPK6VYyN0E4yCw6sG+/XaRS5ugkWApTE/jIx
	 MYsxOuhTFqnoVIPxmTbWWMYmt7DmvasQbEuh4k8x3LeOAthlDsGR/Ttir+OC4NdgXxheh
	 y4F5FY9LI10CvfTbG8XxIUtS6NhWZHEv0VGeHP7bXUhyZnXJIH+RFjmiy6iS0Mr26H/iS
	 0iCx3Rg/qCogCSslDVlGlLSzCuIDV4wqF659mNV3FAt46+aK0Hk43ApGTGO9bzOAfYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaZcjbGn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LlP2y1Mk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FF6606A33F
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56FF6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaZcjbGn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LlP2y1Mk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVGuM1381030
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=; b=UaZcjbGn3TKsKDJl
	LTnEuIUZvzso3Ez6PKujRGseSzEHxp3rQ80tLfEES+2Mx0wjvxR3epUAfM91udkv
	btk6Kgi2bGJC5UVSSsLlMEs3I6tKkHpqETJThdz+kAWtflBHY1nqmbduerjdtK93
	04tQrWwQaqPG6K1oOI8mexzLei4Zl1e17gfgqDtdceBgxVuFstXT8R26GArO2D2m
	9OaTYwuWMJQFrDpI9s83I/4D4RLG2o7DdC5zJIGZ4K3KTb2ho7JP/O/FzSS3sG+i
	7trNKwods2YCZp/ZmvQnYvfcfgO8kvz/Tlsa+x/0hbA9sYlrrT9V9dsdVWk5WEu7
	Hkbexg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w044yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:41:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so3392462eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376490; x=1795981290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=;
        b=LlP2y1MkHTxcoBaP7zNBlC4lSa2q4XsGLohm1/xx0MOjMJgBmrPh11Tvj2S1pdONuE
         aEXd9Bddp/fbqFWLCSjYe56o+VC6EJE1X3MJ+ukmlzV0BJCt7s2avrK0O7s9w4kmoVg6
         1jt3eyaLA20Sw4BUaMj8h8bQx3L3ql/Jo0C9UqRugs/zKQq24qxov/qQ3twBcD51W9f2
         RE3bfzR38XaGL7kQpCsahoXdkzWt6jg4myUtjpGBYwWckErizaRwP4TB8GBE7CHHH/tP
         yo5rjOLKgo6YCKnm28xNQ8jjz1q33dyWhbITIxFXLbSbuAbLu1YQ6/4PohefQohXzS/O
         TEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376490; x=1795981290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=;
        b=QOzckJdGXZXf8C3iaV4LlfqyOIEraL1qAeYYnFiDKJYA9tDPgG6TNm7OcsmAGjNT1D
         vtX7jvfIWpVJpDjJJtioNEt96w3nmgVnUuAnO90c8oSfver68y7IAuq6WzuZf2F0UuwY
         vUBMs5WePD7fSyfQkHHIJ4g+TJkC54Lrmo/IHIFh/PxNOet4PWh4cV2NAn/HoXK6L7bb
         4iBXkBTRhkS466qY+8bzjwGIjDIy052qeLRnfqoM6mO6SS6rro/GFJztAVTDN/Q1K2ce
         gPZ3zNPJayg+a62NZ09gcNkUXTjRbk4LJpEqcNcPYMKm6kW25B7RhP1nqzGdk7ibbGEM
         Nv/w==
X-Forwarded-Encrypted: i=1; AL+hErHenEuM3oxIMPNKPvPmOkTpb3k58vIjeL78/M5SXxUHIAenqpetuYDj6oDAypCARVopM+Zj08okyNJ+Fdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QaiVPXXYBR0ynPrveEkEmgNQWD0zbspwO+2zfaGzBUnV47FaO
	OE20RzKj1+WE+ti5IDw4Myc74RjKgZQ7mipfrVbwYCqlcmgldqEnSeg+jqHwObAUyDCt9ju0mqv
	Fm252l/wd72KKtREsaqhxMla2ZQg5zhROcgEvdkog+q1tVrjfI86Fh9tvduE4imN4KbA=
X-Gm-Gg: AZFdTZf/hQJ3S9VnixJHzoO8YGxRBvshuJgds1ZlN77dol874fDNU9FkLtiyTyNElIT
	ubCs0T/lqlVroUjoaqyN7dXCAJ6GBqnkC6eWBhztrGx+oPScKurMOlZ0WEkslCPQz+I05EVwKhU
	36PRqkY4swC/H1uWilzNz/LVc9kI0cXdU+86BEjNXSwchoegJc1YOXb8UO5/KQsrUkCSgL1c+lb
	F95iRZBqwD5md5b35xSriV81JuSj3zgZ83mrgZxv5F099oYFDIX7zn8Uq8Y5jNNK57gMemFvLyy
	d5W45qtwT4O3J9FccQ1ideODKLlV7h18PdqjERa8X3X4mzHWUx2kfr5vbo5cMh01/dU07L9FFcJ
	GVgvWSbX1vKgrim90LB/BFgxfRZNur50m+ENjy7KbFH7zbTopz7GaYMlV3kJgF3b3vWOjF+6RuG
	S06OyawfDbow==
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr3124325eec.8.1795376490232;
        Sun, 22 Nov 2026 11:41:30 -0800 (PST)
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr3124301eec.8.1795376489687;
        Sun, 22 Nov 2026 11:41:29 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:29 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 01:10:49 +0530
Subject: [PATCH v3 4/5] ASoC: qcom: sc8280xp: Add shikra-cqs-evk compatible
 support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-shikra-machine-v3-4-e5d074264428@oss.qualcomm.com>
References: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
In-Reply-To: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=1890;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=ADHxLIKy80YYC4X/WhkVFhvJ5Z+R60FIHCh10Djdnek=;
 b=MYmePnWbGhM+LBfRzuDNc5iosZycgXUqbbFjEUXtFtc4uLHlU0KUIberGaJgtp2yMw6gOJcAW
 cdCELuWi5QGCMFzrCtLiUX1l8WlK2G7n2iiyQ8V/ELH3cTBudZqqV6W
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX5yYVYfvxkavj
 ONY8/8wpD1AlC4wzmbssopyHfcdNOEiWVVppNngB6SI6+uuRlRhCFzRf4VD4wKe3ny56fJKCtlt
 HRjEpChVk2dbYHN5WRs9lppLssvNcBrYQOx1eXdZy3BpPkDF0v6NcXKjgca7ziODAg/GXMDJ57t
 s+jUfmGgqWd5RYt9xOZ5Lp5s6MN0zHEtbwhukb3MJzLaR0O5AUaO8KiPH9zFFE1c/2Mpl161DkO
 Nlq/K8C3fOoY7d/S57JBxQFk0SKaVF2NxxGy055g3y/r+IDB4QHl8id992kTb1yVzhbNtecF2rd
 1jtUhQnd9VFacADF7YMUECiLgxAskV22RjR4JZQfNJpPgRf5dZyZD9ZK4qSeR8uIR8MEJeaqwWM
 NTNNrBjfujj7SeTCj91krS/zGwoD3bPwteaRs5wGVjsFYFuJJp68E720KXMfS6ZWds737T1ZFnZ
 f63z3yR1ICXJR8Op5oQ==
X-Proofpoint-ORIG-GUID: -gvebl5U4bfa8v5CHmrmQkrq_C3PtuvS
X-Proofpoint-GUID: -gvebl5U4bfa8v5CHmrmQkrq_C3PtuvS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfXy3D9HWEOJ9+n
 6CQD3/7C0jFkc/hW4MiF0UScY+6NEBilAivq64KaiebDOxuSeHC+ML8YQTU+pFm+xfTL7qzmcNR
 qbj5tPW0mzSSVt1uO6T/XuGvqt/VqHU=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b03456b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=wXg-2A6JSwDC41Kdh40A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Add machine driver support for the Qualcomm Shikra CQS EVK board. The
Shikra CQS platform uses an I2S-based audio path with WSA885x
amplifiers and PM4125/Rouleur codec components with modem-DSP based
audio processing.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index e1d701a1b1dd..bf62e8330276 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -742,6 +742,19 @@ static const struct qcom_snd_soc_common shikra_cqm_priv_data = {
 	),
 };
 
+static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+			.id = AIF_TDM_RX_2,
+			.codec_sysclk_set = true,
+			.mi2s_bclk_enable = true,
+		}
+	),
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -812,6 +825,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
+	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

