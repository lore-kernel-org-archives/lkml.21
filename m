Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798917;
	b=PvsEGxeSzgYxOM3T5ijC4ygWI7+vAOcTMEGt77BovDaqJcefWQLrn8/5NXQUTbeJR0V6
	 Bly1qsEMGHzykLFYdeAqh/po0ocpEfVJQkrDkzQje6Y5CE1Mxpmh4nv5f7CIaFx599TQF
	 XQe0Wjd5cRYpZCZHRsm0Re5bu1cvwNQEyshtZ4KaqrGhKKQWIV21a8KLuS1sdkRTTHJeT
	 B49msDA6LqHusA9AGTd0c/qw4EZofXWDKT3rIszNLgP3K5o3YLZ8JqhnyKoMjnjI+nje3
	 Ajv+hjeFamTLil0UVqBIRpTZS9c1MmeeXv4D/o0hSZfo9q2xTDQqiQmWWQJPY5fCDuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798917;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=a3tpFqOgKpF9Mg+PyUrniN8wECOQ52cJq1QR8omdVMo=;
	b=oT/kgAE6fnQlRGXgHzxDXoszx0S53Q8gRvtWZQlQGSK759t7togck/GVj84WYNENry8l
	 qrSvKAIDtWkNRMlMX5rH5jRe6Sj+t4SiCR3qCw1i5SPV2yqGuAoJlkSmIvPG5hSCfX9mr
	 LApNrsKIUERImYrObR1nnDxBpS+g96ZwuvnP+MDCUPxLSF2V6A4JsSRpUYFXZrJoa3xy3
	 EBQQsV2/TgrQHFGFZ9dw7c7m4PBYah1IGv0qIUAymebrWtxfXP3Npj16xsRH2K0hyyJ7J
	 Biad8RvEuN1reQg8EhW9Kr8ZP0FGAb6zuWa3kt/pEU4i3bHindlhG2lI66oZlHvqMDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BUuIYPYL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JwTYBe2x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BD8606A331
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5BD8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BUuIYPYL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JwTYBe2x
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpCLO925802
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a3tpFqOgKpF9Mg+PyUrniN8wECOQ52cJq1QR8omdVMo=; b=BUuIYPYLZgdXcgQh
	Jd4j5oblTIPyKCG05mdOQDP4wkDZBYPv32N4XQ9zbDtMsYpD53rW14IrB7nILfER
	ZYjJSYiNARQoag/Z3XrYlk6ToGE8SF+kqdryqfiOFXfFfdn6hB5tAmRstRNkHLPP
	WF7N/NFnQN/kWyzkCqSB7NdnZNG3kXFVVuRBmDq1g/+WCTCYtAoU84Z4B+0ObViT
	TqDcuCICdfovgNV6SNYgHsbDdMa2J4+M1AlYeWaosdqI9ry+ADzbHFs/nLCv+5xd
	6kdKvKs5tv9/eLFXKe+t5MUNXttGtmtlZ8WOJ+d5fqTOVQHm0Pfrfg7kkVZEgHJT
	rFEVEg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49bwvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:01:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b937ecbb4so132221996d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795798913; x=1796403713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a3tpFqOgKpF9Mg+PyUrniN8wECOQ52cJq1QR8omdVMo=;
        b=JwTYBe2xXez8QVZIK13Bm/8QF0+G6dL3rE0ixZ64znL3h6A3DIxd6eUFUmLQ+Qbq37
         IjL0OgDMo3pyDXk27pLX1iqGZRRhWvWaHuFQEPMV78PF4uBjzyLqldrEE7E1Fx/zgNyc
         NHLZIx5YVNoOXBqC3OkcBQyg51yKNehwjGWEVGsInZoWOrZmJBDn9lKaS7OWO/MdlpDO
         heyubTvzgyvABQyEp33VVAXTCQtChJ2ZPBEgWH0ZR0CNitD7M+5IQr4IabZwr6dJhcs7
         XrU45xnt/YQnH0ZH/RGX9RqFmXKcCOvaQDPVrnZgq4SwjvCYdWlqtmhg4RANkmcnOjVC
         v4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798913; x=1796403713;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3tpFqOgKpF9Mg+PyUrniN8wECOQ52cJq1QR8omdVMo=;
        b=tilG1DHM7MHWfS5lXkD36kalHvT97AHfq0dfoEn3+bt4lDs+8meBHeSg/IHW/fPP9K
         y6zGmhW8j+y1DRgScC/GulHNT005kL6KghFHyj9xC6bQfERQOtq9TKyTkNS0L6RbpuXb
         fqTeJtXznH670OpIAYO06tgJgd2Gb5ZidPKzLay0Yy+6lKs0QMms1JgD0iFxn6gE0uGY
         UD1ryGdGOFtusL7fj3fRFP43BKtJByqM1sbQcQvduRVQDBG+0AJXp8GuYvl5DXH3n2TZ
         GjFqgTbZv942ENBtnsM5QqHalqiZjXj0AN8wEtSWVGg4rCX9dusYTYKUHXPd8oQtr66j
         zr8A==
X-Forwarded-Encrypted: i=1; AL+hErFQZ8Ras+UyoQqjV/Lyu6azbCeGEDXJSvD11/XLH5d9NCzOxNSpT1DfxSEsEcs+SoDIIDUd7Y/ZH1Hznd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rcXJ+aqRj/kAGXgQw+kDsF9KzK8meax0h3LfLT3C11EQigkEz
	z57xxo8zF5Dko07cgp/+NYvS08hSfJJ+B8rtaUNRl7sTTQ8/fqZp6p4p3gLKC1oExMsbSYGdVpS
	J1LzfGFOSW8RISdOTBzekB5ZuP76GeEtLI70ZUFDHmnjn5OAHY5P634N7L1DDy/CK82uDHZRlox
	E=
X-Gm-Gg: AZFdTZcHc7Bq8QuYNMohchlH2+Cc5L3JRz74dOtq+e4cPsEclZ0qNjRa5yqCWJpUhFO
	/7VNTqF0Ha1gj4bxkKBRL4+Bzko5oY750JiRjWS6eW/EUMt/28TjZSt3ocN2SylrVPF6vvGs+Fl
	LvD9yM+cHRgjjeJ3LL0lsTspu4hfBHT5kQfqIbSfsZOxXbrnuCNu+QqQBWkCLJB5hy9EzcmYqLl
	VnN1WleqkEuJQ6hOLCuT2N4nUS/nACmMLnyMPdgXBHBNAU6LsZRoYUiTgv0ixg8kO6sa0G5Hz6N
	zHpOCwLUyG/9jd35chG33MyMHjFAe/H8nhreNXk61ZP0h1tCggBtxtkvm1gubrhqFaU4nRYefD1
	Ag1vvWl0ALSQ8nsB/8sg66ZS2SEs9EHhA+k/exoWUVverpot+WHK0dfHb8XG3Sdz1+DdqQ9qt2e
	jFow==
X-Received: by 2002:a05:6214:124e:b0:921:1482:43a0 with SMTP id 6a1803df08f44-92134b80fd5mr482213356d6.46.1795798912185;
        Fri, 27 Nov 2026 09:01:52 -0800 (PST)
X-Received: by 2002:a05:6122:d91:b0:5ea:b1f5:a657 with SMTP id 71dfb90a1353d-5ee8aeb4a46mr15581542e0c.7.1795798890254;
        Fri, 27 Nov 2026 09:01:30 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm980228455e9.11.2026.11.27.09.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 09:01:29 -0800 (PST)
Message-ID: <1acf294a-1124-47ff-8591-eb58f2bb6900@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:01:28 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] ASoC: qcom: x1e80100: Allow userspace WSA RX chmap
 override
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
 <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-4-1197ac8eacd2@oss.qualcomm.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-4-1197ac8eacd2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -WHgzmloANscZ-3jZN4FYDV-L07nKx5c
X-Proofpoint-ORIG-GUID: -WHgzmloANscZ-3jZN4FYDV-L07nKx5c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NyBTYWx0ZWRfX+AUPlAiwyUFU
 1yx9JBKkjxsDLeqWbWjuz4hPLSBRACA+P8pbJDhO4pg4E5AnaSdyexFXIjJliJEwnR5uwAXcYVe
 8IbPxETSj9hVEm2eIqGvEVmaNBmipfw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NyBTYWx0ZWRfX0jAwgcTOaP88
 y4Z0jwDDu1147Dgh+Jp4M09zAvpP0rCfrHPwjRGPgsLOF8eXGIPjSl2PS/eVVtvNMkIoCL3zO5I
 BwjnIdcSvd8BBBM6rfGx8y2zRj4pVl/MYA5oBndvphTN2FPk3rroA0l9nYW+ab3y3fSs63ZInEy
 qPvXDI/pEDGHTlJKDDecWcy4GHmRCyKodgPFXXsTu/y8dZtMQbsL7rsU0L91TewIzg8XKAsZCPf
 J/y3y3bgab4WRRplGUfGboOECPqEzV1+aYyaZ28K94UfUU6adfZsk+5qDN+O1LZLYR12SCZfmwi
 wRei42XolI9zKG1RCCTvVvVgBcSJh3f+iHVyey2fQGw74iZnFum5vsYuN1Hak5KgyQ6Ur8+lOXt
 IzmVuf9FEwAb2TM7ssOAxCCZJlUIQrUylvTXQs5yKnJhsOl2W26msNCe9vPTWKoP7Jdl9Flhyjw
 oxUrIEXRAUMogv0SIJw==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b09b782 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6DQespTc9-vRJuCPugMA:9 a=KZtRBZcSfhoCt_Qu:21
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270067

On 11/24/26 10:57 AM, Abel Vesa wrote:
> The WSA RX slot mapping is currently computed entirely from the channel
> count in .prepare() and pushed unconditionally via
> snd_soc_dai_set_channel_map(). Userspace has no way to express a
> different channel map, so any map defined in UCM is ignored.
> 
> Add writable "WSA Playback Channel Map" and "WSA2 Playback Channel Map"
> controls on the WSA RX backend PCMs, using the standard ALSA channel map
> TLV. Store the userspace-selected SNDRV_CHMAP_* map per WSA backend and
> translate it to Q6 PCM_CHANNEL_* slots at .prepare() time. Keep the
> previous default mapping unless the selected map describes exactly the
> prepared channel count, and reject maps with unset positions in the
> middle, so a wider map is never truncated for a narrower stream.
> 
> Until userspace selects a map, report the default one for the last
> prepared channel count, initially stereo. The map only takes effect at
> .prepare() time, so refuse writes while the backend is prepared, and
> snapshot the map under a lock so a concurrent write cannot tear it.
> 
> The controls are added from the card late_probe callback. The backend
> PCMs are only created after all DAI links are initialized, and adding
> controls from the stream startup callback would take controls_rwsem
> under dapm_mutex, deadlocking against DAPM mixer writes.
> 
> Allow up to six WSA channels for Glymur.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Hi Abel,

Thankyou for the patches,

I tried this on Glymur CRD. this is what am getting.


root@qemuarm64:~# amixer cget numid=150,iface=PCM,name='WSA Playback
Channel Map',device=16
numid=150,iface=PCM,name='WSA Playback Channel Map',device=16
  ; type=INTEGER,access=rw-v-R--,values=6,min=0,max=36,step=0
  : values=3,4,0,0,0,0
  | container
    | chmap-variable=MONO
    | chmap-variable=FL,FR
    | chmap-variable=FL,FR,RL,RR
    | chmap-variable=FL,FR,RL,RR,FC,LFE


However crd has 4 channels, for some reason the default channel map and
channel count is not getting applied to this mixer.



--srini

>  sound/soc/qcom/x1e80100.c | 246 +++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 222 insertions(+), 24 deletions(-)
> 
> diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
> index c927672eaede..4fe86ec062c4 100644
> --- a/sound/soc/qcom/x1e80100.c
> +++ b/sound/soc/qcom/x1e80100.c
> @@ -5,6 +5,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/soundwire/sdw.h>
> +#include <linux/spinlock.h>
>  #include <sound/pcm.h>
>  #include <sound/jack.h>
>  #include <sound/soc.h>
> @@ -15,14 +16,151 @@
>  #include "qdsp6/q6dsp-common.h"
>  #include "sdw.h"
>  
> +#define X1E80100_WSA_MAX_CHANNELS	6
> +#define X1E80100_WSA_PORTS		2
> +
>  struct x1e80100_snd_data {
>  	bool stream_prepared[AFE_PORT_MAX];
>  	struct snd_soc_card *card;
>  	struct snd_soc_jack jack;
>  	struct snd_soc_jack dp_jack[8];
>  	bool jack_setup;
> +	/* Protects the WSA channel map state below */
> +	spinlock_t wsa_chmap_lock;
> +	/* Userspace-selected SNDRV_CHMAP_* positions, 0 means unset */
> +	unsigned int wsa_chmap[X1E80100_WSA_PORTS][X1E80100_WSA_MAX_CHANNELS];
> +	/* Channel count of the last prepared stream */
> +	unsigned int wsa_channels[X1E80100_WSA_PORTS];
> +	bool wsa_prepared[X1E80100_WSA_PORTS];
>  };
>  
> +/* Default WSA RX channel maps, indexed by channel count */
> +static const unsigned int
> +x1e80100_wsa_default_chmap[X1E80100_WSA_MAX_CHANNELS + 1][X1E80100_WSA_MAX_CHANNELS] = {
> +	[1] = { SNDRV_CHMAP_MONO },
> +	[2] = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR },
> +	[3] = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR, SNDRV_CHMAP_FC },
> +	[4] = { SNDRV_CHMAP_FL, SNDRV_CHMAP_RL, SNDRV_CHMAP_FR, SNDRV_CHMAP_RR },
> +	[6] = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR, SNDRV_CHMAP_RL,
> +		SNDRV_CHMAP_RR, SNDRV_CHMAP_FC, SNDRV_CHMAP_LFE },
> +};
> +
> +static int x1e80100_wsa_port_index(unsigned int dai_id)
> +{
> +	switch (dai_id) {
> +	case WSA_CODEC_DMA_RX_0:
> +		return 0;
> +	case WSA_CODEC_DMA_RX_1:
> +		return 1;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static struct x1e80100_snd_data *
> +x1e80100_wsa_chmap_kcontrol_data(struct snd_kcontrol *kcontrol, int *idx)
> +{
> +	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
> +	struct snd_soc_pcm_runtime *rtd = info->pcm->private_data;
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +
> +	*idx = x1e80100_wsa_port_index(cpu_dai->id);
> +	if (*idx < 0)
> +		return NULL;
> +
> +	return snd_soc_card_get_drvdata(rtd->card);
> +}
> +
> +static int x1e80100_wsa_chmap_ctl_get(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct x1e80100_snd_data *data;
> +	const unsigned int *map;
> +	int i, idx;
> +
> +	data = x1e80100_wsa_chmap_kcontrol_data(kcontrol, &idx);
> +	if (!data)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&data->wsa_chmap_lock);
> +
> +	/* Report the default map until userspace selects one */
> +	map = data->wsa_chmap[idx];
> +	if (!map[0])
> +		map = x1e80100_wsa_default_chmap[data->wsa_channels[idx]];
> +
> +	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
> +		ucontrol->value.integer.value[i] = map[i];
> +
> +	return 0;
> +}
> +
> +static int x1e80100_wsa_chmap_ctl_put(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	unsigned int map[X1E80100_WSA_MAX_CHANNELS];
> +	struct x1e80100_snd_data *data;
> +	bool changed = false;
> +	int i, idx;
> +
> +	data = x1e80100_wsa_chmap_kcontrol_data(kcontrol, &idx);
> +	if (!data)
> +		return -EINVAL;
> +
> +	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++) {
> +		map[i] = ucontrol->value.integer.value[i];
> +
> +		if (map[i] && qcom_snd_chmap_to_q6(map[i]) < 0)
> +			return -EINVAL;
> +
> +		/* Unset positions are allowed only as a suffix of the map */
> +		if (map[i] && i && !map[i - 1])
> +			return -EINVAL;
> +	}
> +
> +	guard(spinlock)(&data->wsa_chmap_lock);
> +
> +	/* The map is applied on prepare; refuse updating prepared streams */
> +	if (data->wsa_prepared[idx])
> +		return -EBUSY;
> +
> +	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++) {
> +		if (data->wsa_chmap[idx][i] != map[i]) {
> +			data->wsa_chmap[idx][i] = map[i];
> +			changed = true;
> +		}
> +	}
> +
> +	return changed ? 1 : 0;
> +}
> +
> +static int x1e80100_add_wsa_chmap_ctls(struct snd_soc_pcm_runtime *rtd,
> +				       const char *name)
> +{
> +	struct snd_pcm_chmap *info;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = snd_pcm_add_named_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
> +					   name, snd_pcm_std_chmaps,
> +					   X1E80100_WSA_MAX_CHANNELS, 0, &info);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The core registers a query-only control. Make it writable so that
> +	 * userspace (UCM) can select the WSA channel map. The card is not yet
> +	 * registered at this point, so the control is not visible to
> +	 * userspace while being modified.
> +	 */
> +	for (i = 0; i < info->kctl->count; i++)
> +		info->kctl->vd[i].access |= SNDRV_CTL_ELEM_ACCESS_WRITE;
> +	info->kctl->get = x1e80100_wsa_chmap_ctl_get;
> +	info->kctl->put = x1e80100_wsa_chmap_ctl_put;
> +
> +	return 0;
> +}
> +
>  static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> @@ -109,29 +247,43 @@ static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>  	return 0;
>  }
>  
> -static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
> +static int x1e80100_snd_build_wsa_slots(struct x1e80100_snd_data *data,
> +					unsigned int dai_id,
> +					unsigned int channels,
> +					unsigned int *rx_slot)
>  {
> -	switch (num) {
> -	case 1:
> -		ch_map[0] = PCM_CHANNEL_FC;
> -		break;
> -	case 2:
> -		ch_map[0] = PCM_CHANNEL_FL;
> -		ch_map[1] = PCM_CHANNEL_FR;
> -		break;
> -	case 3:
> -		ch_map[0] = PCM_CHANNEL_FL;
> -		ch_map[1] = PCM_CHANNEL_FR;
> -		ch_map[2] = PCM_CHANNEL_FC;
> -		break;
> -	case 4:
> -		ch_map[0] = PCM_CHANNEL_FL;
> -		ch_map[1] = PCM_CHANNEL_LB;
> -		ch_map[2] = PCM_CHANNEL_FR;
> -		ch_map[3] = PCM_CHANNEL_RB;
> -		break;
> -	default:
> +	unsigned int map[X1E80100_WSA_MAX_CHANNELS];
> +	unsigned int i, set = 0;
> +	int idx;
> +
> +	idx = x1e80100_wsa_port_index(dai_id);
> +	if (idx < 0)
> +		return idx;
> +
> +	if (channels > X1E80100_WSA_MAX_CHANNELS ||
> +	    !x1e80100_wsa_default_chmap[channels][0])
>  		return -EINVAL;
> +
> +	scoped_guard(spinlock, &data->wsa_chmap_lock) {
> +		memcpy(map, data->wsa_chmap[idx], sizeof(map));
> +		data->wsa_channels[idx] = channels;
> +		data->wsa_prepared[idx] = true;
> +	}
> +
> +	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
> +		if (map[i])
> +			set++;
> +
> +	/* Use the map only when it describes exactly this channel count */
> +	if (set != channels)
> +		memcpy(map, x1e80100_wsa_default_chmap[channels], sizeof(map));
> +
> +	for (i = 0; i < channels; i++) {
> +		int q6 = qcom_snd_chmap_to_q6(map[i]);
> +
> +		if (q6 < 0)
> +			return q6;
> +		rx_slot[i] = q6;
>  	}
>  
>  	return 0;
> @@ -143,13 +295,14 @@ static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>  	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  	unsigned int channels = substream->runtime->channels;
> -	unsigned int rx_slot[4];
> +	unsigned int rx_slot[X1E80100_WSA_MAX_CHANNELS];
>  	int ret;
>  
>  	switch (cpu_dai->id) {
>  	case WSA_CODEC_DMA_RX_0:
>  	case WSA_CODEC_DMA_RX_1:
> -		ret = x1e80100_snd_hw_map_channels(rx_slot, channels);
> +		ret = x1e80100_snd_build_wsa_slots(data, cpu_dai->id,
> +						   channels, rx_slot);
>  		if (ret)
>  			return ret;
>  
> @@ -170,6 +323,12 @@ static int x1e80100_snd_hw_free(struct snd_pcm_substream *substream)
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	int idx = x1e80100_wsa_port_index(cpu_dai->id);
> +
> +	if (idx >= 0) {
> +		guard(spinlock)(&data->wsa_chmap_lock);
> +		data->wsa_prepared[idx] = false;
> +	}
>  
>  	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
>  }
> @@ -181,6 +340,40 @@ static const struct snd_soc_ops x1e80100_be_ops = {
>  	.prepare = x1e80100_snd_prepare,
>  };
>  
> +/*
> + * The WSA channel map controls are added here rather than in the DAI link
> + * init or startup callbacks: the backend PCMs are created only after all
> + * links are initialized, and adding controls from startup would take
> + * controls_rwsem under dapm_mutex, deadlocking against DAPM mixer writes.
> + */
> +static int x1e80100_late_probe(struct snd_soc_card *card)
> +{
> +	struct snd_soc_pcm_runtime *rtd;
> +	int ret;
> +
> +	for_each_card_rtds(card, rtd) {
> +		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +		const char *name;
> +
> +		switch (cpu_dai->id) {
> +		case WSA_CODEC_DMA_RX_0:
> +			name = "WSA Playback Channel Map";
> +			break;
> +		case WSA_CODEC_DMA_RX_1:
> +			name = "WSA2 Playback Channel Map";
> +			break;
> +		default:
> +			continue;
> +		}
> +
> +		ret = x1e80100_add_wsa_chmap_ctls(rtd, name);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static void x1e80100_add_be_ops(struct snd_soc_card *card)
>  {
>  	struct snd_soc_dai_link *link;
> @@ -201,7 +394,7 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
>  	struct snd_soc_card *card;
>  	struct x1e80100_snd_data *data;
>  	struct device *dev = &pdev->dev;
> -	int ret;
> +	int i, ret;
>  
>  	card = devm_kzalloc_obj(dev, *card);
>  	if (!card)
> @@ -211,6 +404,10 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
>  	if (!data)
>  		return -ENOMEM;
>  
> +	spin_lock_init(&data->wsa_chmap_lock);
> +	for (i = 0; i < X1E80100_WSA_PORTS; i++)
> +		data->wsa_channels[i] = 2;
> +
>  	card->owner = THIS_MODULE;
>  	card->dev = dev;
>  	dev_set_drvdata(dev, card);
> @@ -221,6 +418,7 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	card->driver_name = of_device_get_match_data(dev);
> +	card->late_probe = x1e80100_late_probe;
>  	x1e80100_add_be_ops(card);
>  
>  	return devm_snd_soc_register_card(dev, card);
> 

