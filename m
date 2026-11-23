Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452988;
	b=LnIkbKIX40y/y2J37R8TL+89RO1JTWtjDqiSaJslsCGkon9SPy8g/J7cTYJRnNa7NWKb
	 vVZbmhLsKwoi0RlQsUYFh+OJM3fk/cE9E64O4NZ6nb+7tzta3DJfK4qdka0zw5YPLwKxb
	 x9N5uBcr7ESQjbjA3x4hDbw/E2ek7RU/lTNn84GGCRF2c+gwn3CA/igQ9vtUAWnZYfXtB
	 SQ0w0g+VyPpZ064VD3Lui9SA6JVVwa6yDQSG8Bg3FYu5MddAwLcJojkLgphT9PiuVJh6P
	 uolKz3mcY5Z3brWdgr6hRTP1o+lemZljwH1eF/ZmtNstcr8P+L4vFTlgYUin9ltWVcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CGVPPrBmIbSMP3ik97JAyLMMvXQoK/X87ePEsEfxJRM=;
	b=EUV1ZCXnoHT+8H2u9l858XHe8vC9ShYrjUMelnf3TQxDXXRFdgqk7Wpf/nWt5P9ASE2v
	 3aZgqxfb3X/uDIjSlQXBZYrwmnDI9cpnWU5ezQowv2nc2Rk1WR6kDz+KSyaEmvOJJs5qO
	 C9vPM5NoHNAaDeWXV+NioHuBoa4JGaMCcqyv/2QT/jlfqmCglq/02Fj/yATYrZdpxyV2L
	 vRgkQi8oaWy3o4kbxamZ0Di+w+qX3A8vAJAOy3RjsfsNvOg5JufI+VbBJJ4kb/Ic2kBwo
	 C/8NgWhnUvy8m5gvIdpQDJoHjJc3OYUjSoHthEqIu9N5QD08L33rXkgIXTvAy5GDAMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lKK0SyD6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dZVrCwXv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AF7606A689
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93AF7606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lKK0SyD6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dZVrCwXv
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGjvU3025217
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CGVPPrBmIbSMP3ik97JAyLMMvXQoK/X87eP
	EsEfxJRM=; b=lKK0SyD6HHRAYUGGP1YMe71pS2wfClCPY1HjPf9453NXyJECyT4
	ynu4cEIW0+qrtE0n+ymBljvnCtRVXfnm8z1NKfdtRpOguchkeHfysBcWJLTESjRX
	M/8bNjEyfDodBNZ2d1TJsEoLIuB6DXn6wF+oBLWxJPLch0XfKxBKwyHIhhE01YYk
	BfHMPQz1d+tNj5yRUaSGjcm3L2pgYjaOi2h9eOxAqbiNoGvDKbCAie+E2fi0/rZa
	StOt9G/hp2D7DmLfDObD0uNLCewu8udte9VZp969MVrwsav/2DV3gWX2n3d1DQqy
	HqpYPssyjgfx6FqvVOQ6EzaYJwxNJULaBFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pafst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:56:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944138ed63fso47382985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452985; x=1796057785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGVPPrBmIbSMP3ik97JAyLMMvXQoK/X87ePEsEfxJRM=;
        b=dZVrCwXvcdZCjL/B7BePaWrwPtTKkgiEcrrXAJRqL+Ev1uuc3YFlj7DUvBNtYHlEMW
         K+b3XsDLBG4v6FkaQWNz0NUqhqtzHonNNonX69+mw209kVCtN8ssxBbWwSGCcNre3VVL
         uFrZ75Nw+3FSu0Z87KjD63F5zrmKzFzNruAYf50QQ2F7KKvZCfAvEhiKEircq6NC6I9w
         LAXzgFSFMkwCtQapE4nW1mCRRgeYNbhxr73AyHzQwVQCGZ64VecR4JVcTrKIg4qqMXBh
         9ZcRUXqhcbi/pwIqXsrtX+Le22cAOI3mcbuazF88jJTEn9ub83vsAD8xrmyzzY3FcGzP
         NKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452985; x=1796057785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGVPPrBmIbSMP3ik97JAyLMMvXQoK/X87ePEsEfxJRM=;
        b=yED/ijpB7tWT3Ga2bjuxSzz/4PiV84m8OL62pCHfi1rTw8epfRswXpHYzdHoN4+Zqf
         MFFMLdTyd3Sze7L2HRdO87/WeJxIJd41ILOKz+PaDwtlmAdkVH625Fp7nHn5L6G4xtMY
         fiLGsu9FkO78BAm6jGpmkBWYJ+TZBrsSognY6GZuet2hXIL/ZOV22lGfN9Rd2NVowuRG
         Bpmo5ZStz3far/jCWKEjHhdXgJ3lisFd1tg6zG8LXql33CWc5qexquhnR7icYqvqbto7
         cSWn0UT8AxPF84oZRKvzLJnIDzrN4882RqIhp4OfSrktp/ZO9xz1VwkUzI90Q+y8ZGD/
         NyAA==
X-Forwarded-Encrypted: i=1; AL+hErESqND2cZAx5tCsQv68A9bJ3wJVI5RRaRhvc/PGNffe0g+nQWaP1OYSujFd4ydDwX07p8pybYanZsemMfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v+fN7FTbMxi8twbeo36yPScf9KlgpuCS1cDY/RjKDsLfVXBhU
	xi6ylO3bqElmmE91/wMU7BsHjKH4fYoqGe8h9gGZUWWYraW/e04VXIwZ7JPtD2VP1cYP2QpiInJ
	aAcOjNfsOYwHJmK43Y1XfCqj8KpXCGlEKn78Zh/tAExKKZmOCRDtyAMkhMLURX3CGKVk=
X-Gm-Gg: AZFdTZc7n3HtDG4vFUisacAUTroo6mTUWK7DW6kBJl9dWqr207kRfaYJ0WJ4qgzFJ4Q
	L/FzSQz/RsuiQlpCdxeI2Qd7dkjIAGv4friyOi/RM/ZzjViBm78h1iofPLmVspxQz7OwO32gGqL
	do7zXzUVz7y96Si8iu+yHoxZWtBvbef+gOB6zsW0WjDGEX4qbXnht9PV77i2cJuvvirMErIImMH
	XSmKZNnkF2OWPBU8+pA3ncSTV2XeGKxITHdhdKE7/8ORvsFFjyjOiYEN/2G1Uru3OCLQqhrywJ3
	bWtXotDVsK+HooaZMwX0qZJO5Losusoz2UZDl3jS+OpSg/pmD+PSyHXyaMPXkqZvv/n1mi9uddS
	NQW7p0/IJosV32R1LSnci+LvOi8N2QtX14SI5qk3QguHAI4a3nNkwjwJ5aOtHL2B6
X-Received: by 2002:a05:620a:2615:b0:947:9faa:af29 with SMTP id af79cd13be357-949bab1ceadmr1956510285a.54.1795452984679;
        Mon, 23 Nov 2026 08:56:24 -0800 (PST)
X-Received: by 2002:a05:620a:2615:b0:947:9faa:af29 with SMTP id af79cd13be357-949bab1ceadmr1956504285a.54.1795452984115;
        Mon, 23 Nov 2026 08:56:24 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm498217885e9.13.2026.11.23.08.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:56:23 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH] ASoC: SDCA: skip port channel mask for Output Terminals
Date: Mon, 23 Nov 2026 16:56:12 +0000
Message-ID: <20261123165612.440542-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: u-XhNDXUw6XIMDsryE3vbfuQAZ4zqszK
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b047039 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=JbQxR-g00cxq26BlPqcA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NyBTYWx0ZWRfX+0iNF4b0riq/
 0rl7YJXRu1bW2+9McN19ry+1jpAcj1cIvJ0hvtKi6AAWOJylKrXUFsMwLXvqoS7SmEyFmlaNF71
 KNV6XGfJbZfgHmxSZl5ru3LoSms0t1w=
X-Proofpoint-ORIG-GUID: u-XhNDXUw6XIMDsryE3vbfuQAZ4zqszK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NyBTYWx0ZWRfX7Oz5Qqnq+shk
 f+TqbpQ1HvSiIo0stIcW31xuJXYiNw0wDdWoqI0hoAWHTD3UlI53GHvUYhOMqURrdeHcmdIugEv
 +zz3ORmka+omFscqYCfT5hVbHlXp9PPgjbyc15kGiHqVmKsis28brVaMRJzEAbQSxaJjfzj+/qy
 fQ+0BwUnpqlmHuF+Bv9TS9zK0i3xvp2M2saj6CtPwnRLQqnQWeiiy5K8Ktr60Pc6onBsIYVhcyY
 CUM2mSJrD7Y57Pb7pkYqG/RTgDHzpHLhdUGNTfU/HNdbFOjrdgvecSexQ1z/5SGow1UMkgXWzuM
 UOZAbtySQ1wmAiPrnM7Qasf+fW9fG/VREArlrdrf9s1FiJfx6pAyBaFcK6XMhTJKkbXmKBswa6V
 o2NBDRh8vTLsh8Tn0T28fmaVnn4Dz8lm3Pt69kPfI+ao/ivnnUlR5UXN8Q7MWXTAUouRsUC+vRN
 7/Pb7UZhU1HxP1+RWPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230067

Commit 8bb24d87078f ("ASoC: SDCA: Add port constraints into
sdca_asoc_set_constraints()") started intersecting the DAI channel
mask with the SoundWire DP port min_ch/max_ch for both Input and
Output Terminals, installed via snd_pcm_hw_constraint_list() from
startup().

In DPCM dpcm_be_dai_startup() aliases be_substream->runtime to
fe_substream->runtime, so the per-substream rule lands on the FE
and narrows its hw_refine().

For Output Terminals the port sits below the DSP capture graph,
which can present an FE PCM with a channel count different from
the wire. WCD9378's headset mic is single-channel on DP2 but is
exposed as a stereo FE capture by Qualcomm LPASS; port_ch_mask is
0x1 and any arecord with channels_min > 1 fails with "Slave PCM
not usable".

Only intersect with port_ch_mask for Input Terminals and leave
Output Terminals on the cluster mask, restoring the behaviour
there to what it was before 8bb24d87078f.

Fixes: 8bb24d87078f ("ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_asoc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index aaa84156f20a..6e42f5262aa7 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1645,7 +1645,14 @@ int sdca_asoc_set_constraints(struct device *dev, struct sdw_slave *sdw,
 
 	constraints->channels.count = ARRAY_SIZE(channel_list);
 	constraints->channels.list = channel_list;
-	constraints->channels.mask = cluster_ch_mask & port_ch_mask;
+	/*
+	 * OT paths may re-channelize downstream of the port, so only
+	 * narrow with port_ch_mask for Input Terminals.
+	 */
+	if (entity->type == SDCA_ENTITY_TYPE_IT)
+		constraints->channels.mask = cluster_ch_mask & port_ch_mask;
+	else
+		constraints->channels.mask = cluster_ch_mask;
 
 	if (!constraints->channels.mask || !constraints->width) {
 		dev_err(dev, "%s: no valid constraint masks channel: %#x,%#x width: %#llx\n",

base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.53.0

