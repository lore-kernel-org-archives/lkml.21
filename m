Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364093;
	b=oeVihHFIKuemOWn+X1ZdCp2lTxyXADNjTcDCdiJ7vMlzgpneyCFCBaq1VzmUf869DgQj
	 ml8E3hZkaJf+zkZbNeJd5wJAmYtGSRHILtmudtbrMR1JyM2VTgG1VohSVfwo0OqGf/lFr
	 hac7p2kJHbv+5XUGiDOz2UsSPrn9TDh7ciF+RsRcVkrM1oq1BJverKWdbLJj5tPWTlHRH
	 /yHjqiD6QMC6STJcGr5XJCmeqHp9wuD5HvU+7Po63mPXedR7/zpR2Qal/rBN0X57yg/Ix
	 WcrQnEAIqNaZQyDxMcFpep2cdLfiA4W5mysHDIu4PuMRMjzlZlodFPD1rYA5qd1oWyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364093;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a8VlH3z4mHpuuzsiY+CNzQ4V7ZtMtsMQjZ3c7RXsaWk=;
	b=XiAhMWwdU8Iiz5eJXqE6iNN8kOZ21BSN5BjweKGJkPCWW0hbqyrcvmqhq1jOtHSv75NU
	 XfP80MSU2vrRfiUO7AVnIpH5X9v7Rfsb2L2rXHMDEVJipA673Mo4KQMW/uwHtZQ7nhk5q
	 xuXuAz98PKkIvNhmFiWajdQjLT9byaCK4EOCKm1p8QwGa0INA8DCiALJAz5HnM7FV+jv0
	 0W81W1R3dksCVtjzY5kIVM6bwhJNzSt7/tf9zAwnTOpMqeFsQRJPzEdRWA7Bueyky856U
	 hxfEZ4P2rSLeZB9VZNWHPyNsOtMTvGeDaJNY3hXt0u1+AMfkVVODCUMhAGDR4MkFBxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dq64RggO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OerYIfoA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF5A606A682
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAF5A606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dq64RggO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OerYIfoA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQW2g3496180
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a8VlH3z4mHp
	uuzsiY+CNzQ4V7ZtMtsMQjZ3c7RXsaWk=; b=dq64RggOcJRrUCDVdafSZB9zmA5
	NVyjg120Tyh6j/MWLvHP7SGv1Izddk9liUBUNmCeR4kWn7LMJY1byvP3+MoexFzl
	ibivtyv4rsrQuO3k6Ygu1dS/fPlHok6d4yV+SnvM36h4qtffItGkPJ9zQVC2VHqd
	LqyjvpIgmMgeB8sX/1+zGrEBpS7q/+HK7j42dLhB9PHUt0aIBGn4WMzsq85ZZ36Z
	s0i6mQjOHdgTXfzJBZcd90XYDvU+oZjhR+wtR60IwHKZwLbKQUh0hOLw4GmC1+Wv
	nEKt9vZaPJP23OA0AgCsm+MDGQJevUZk0XxBhZuOY2JZyXgcR71ec+QBQyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgbttc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:14:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960131befso408724985a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364091; x=1795968891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a8VlH3z4mHpuuzsiY+CNzQ4V7ZtMtsMQjZ3c7RXsaWk=;
        b=OerYIfoA0Qu+IVHy6Pw7uNi2600Vv2xB5ybktxklW8a3U+NazGKCs7N690iuJTDJta
         Pt69WPlRgGOGPursec/WQMZFirHupfWhD1nyF0ZWI5nRj/k+nq0QIQgyWMJr1xAcZ9sb
         8lZKpH5dh0VRnU3EjBZFoQHnMXIB+qq4RRwleERNqHQSu5Oa68BJmo7/fZ6wO4FabcRV
         0j8PgWWPVwvu34UmZQSWPlAEEA2pOqATcl1zwtl8/e5M8AseT8uEi8F3HO/Ymfy6YxLi
         ODSLF8iOpavswXQY2EWwB/9b5HbGLx/L2iDUD2UulAp7ckh4ny0zKhT4ouAaItZ0K3ye
         vXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364091; x=1795968891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a8VlH3z4mHpuuzsiY+CNzQ4V7ZtMtsMQjZ3c7RXsaWk=;
        b=V9wWwU8gUfYyx+1ZpG//85axPX/Vm9DVo3O2iAX5JodDJJbyzFlIjhp+K/HqcX4EZM
         rFXEwUEoRS8cUx3qPCG6RkfM7CJ7/AjWBn03yRDx+uuI/iIeWoo9H3XxyYyJAgOYtra6
         dbmPISoLxYkR7a3eirbxKRxe+/1ox4kb+aYpHAU755qZvp+5wq4wP1IQ2K2bN+tgAxiK
         mIOo5Z8er0kSzBjZv+ylzm2dYmDWhCAazwK0P1Rp+mcbDQaVBRZ8Yy0ahheXjy4DXW7T
         LB3GEe0FGXJmFMnL9r+VuTUyS85IPUrNsnFpiK/FIwLXdaxzXwod8F7k32CTZHs/WS/C
         u/fA==
X-Forwarded-Encrypted: i=1; AL+hErFBrp9y8TbUHwDSlXWzglDQdVIXa6qHukmNY3uAELv9xmP+e2xZxIdkazzQgDkuIIfH7fcRLbHVmzK2jeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oWs1tAVIiX/s0qvuRCJmDtctj+Qstl9Na1bzVzzS/H/oCLlYW
	Qo8ImK07LhlX1CJMBEIReAxP2/cUkonEnwYZn7cWEso57jfIYUc2EPGH6ihQP/29+iVo/CkBK2R
	H4qCtOxs5F7d7kVjsXab5Z/7HP4GZT6akNQFAIk9tAkGMBw6qxEUCU1rOrcFXz/SoVyc=
X-Gm-Gg: AZFdTZe7bcvEjHoGnuVcxUeCUZmIzarcIqdfk+pRv7R9rmiU3k0PGCs0IWJPdmnpmrt
	HkWY4GA9V9RXaq/uoA7e5tl/jsh66hU7DcYrE9Lj0y1kl4HU/agKhZMo+EWsMyAw6UwJrYD40we
	1RicbnSk9M8rBREdxufabm21vTUvGvUVc9Nx71h057LEj9n7kvzGNmf1rGORRhZKs8yVUvUiF0f
	98/CdE1Qawfaqd5vnhtWoYtEcSi7ZLET2CcoqXvVpaUVLtV0STqxooyBA6jUgrpV6qXGbxwUOnU
	o2DlT/QbMcS326iAi35JIuK0BB4IXAxuDRrja63THMBKRu9V2xQArfvTBIzyaiE9+BAM1nEyHhZ
	dkbBBGkTQ1dkq+osGlk4BztoS9wbng5qZ0+uT2mga0FVaaOADC2BG5Ybs51LzAgMS
X-Received: by 2002:a05:620a:1307:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-949ba9db70bmr1502847485a.46.1795364091126;
        Sun, 22 Nov 2026 08:14:51 -0800 (PST)
X-Received: by 2002:a05:620a:1307:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-949ba9db70bmr1502842285a.46.1795364090576;
        Sun, 22 Nov 2026 08:14:50 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:49 -0800 (PST)
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
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 01/24] ASoC: soc-core: always allocate default ch_maps
Date: Sun, 22 Nov 2026 16:14:14 +0000
Message-ID: <20261122161437.5994-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXxDZmH+SvszAR
 C9l4pSzqeyjApQ8LoVBzRccJ3FAg1Ft0K2Zuyn9yJ4fgKdkCloEhe1nC43y6VqkjijJxvmDzpn5
 Dc0hFKGCN9mdKDNJ8R/NKTdtapz7pS7ExK5aRBgZ60NjL2hsTT5dpHEJbvXxj5/QBYoMvMYIAug
 r5hHlHQCAb4XnCtZt26Z8uRIEzu0Xa1oSQyvz/JDXCxnB0AiScj03dGYX71wXbB3Hs5ORag5ctm
 nDFEb2Ky6LTIS4itntEyi+djQQPq7rks8/S5VyyWqEoN4lfJZuUVgGmx+6EdXTc8VE3bhxx7Els
 CMjavRSMx7Kb62K7FrfNvDZzCQusiVtf2ecEcnv3oz8OqPxKi7uCBJ94pEaMhZPkmqyyyGoRjtr
 r5Wfc8CXHMmUoYAJDSn3hRjBFojrjL+yyZk5NXdkykHbjA+OOUm5gftLD4tPe9pC/+5Bd+YabiO
 lZ1V6oBu4DRowff54tQ==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b0314fb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=4_3eo341WbAlbDCHFrgA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX07NGDQpKCT0l
 mLsQL9N8CIHLHEajw5FgQ2MWLIKYUK/CvvZf3iPGZGOWZmDrDpswsWDIRAIhAWm3KxOHBZTVcd/
 eIxmLGJOrYWQ3lHfQoS39GxpHcwZkEo=
X-Proofpoint-GUID: Bp9GrVYSeIPMLSzM4wUyyJfnGRngnEEI
X-Proofpoint-ORIG-GUID: Bp9GrVYSeIPMLSzM4wUyyJfnGRngnEEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220064

The default ch_maps come from three file-scope static tables of twelve
entries each, and links wider than twelve DAIs are rejected up front.
The cap is arbitrary -- the tables encode "cpu = i" or "codec = i",
information soc-core can synthesize at bind time for any link width.

Replace the static tables with a devm allocation on card->dev sized
to the link, and drop the MAX_DEFAULT_CH_MAP_SIZE check.

The devm buffer's lifetime matches the card bind, but the pointer is
stored in dai_link->ch_maps -- and machine drivers commonly declare
dai_link as file-scope static storage, so a bare write would survive
into the next bind as a dangling pointer, and the "dai_link already
has ch_maps" fast path at the top of this function would then reuse
freed memory.

Register a devm release action that clears dai_link->ch_maps. devres
unwinds LIFO, so the action fires before the buffer is freed; on
rebind the static storage is already NULL and the normal allocation
path runs cleanly.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/soc-core.c | 101 +++++++++++++++----------------------------
 1 file changed, 36 insertions(+), 65 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7dfd79b4ca3e..ccd1cb5ee673 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -766,63 +766,20 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 	return -EINVAL;
 }
 
-#define MAX_DEFAULT_CH_MAP_SIZE 12
-static struct snd_soc_dai_link_ch_map default_ch_map_sync[MAX_DEFAULT_CH_MAP_SIZE] = {
-	{ .cpu = 0, .codec = 0 },
-	{ .cpu = 1, .codec = 1 },
-	{ .cpu = 2, .codec = 2 },
-	{ .cpu = 3, .codec = 3 },
-	{ .cpu = 4, .codec = 4 },
-	{ .cpu = 5, .codec = 5 },
-	{ .cpu = 6, .codec = 6 },
-	{ .cpu = 7, .codec = 7 },
-	{ .cpu = 8, .codec = 8 },
-	{ .cpu = 9, .codec = 9 },
-	{ .cpu = 10, .codec = 10 },
-	{ .cpu = 11, .codec = 11 },
-};
-static struct snd_soc_dai_link_ch_map default_ch_map_1cpu[MAX_DEFAULT_CH_MAP_SIZE] = {
-	{ .cpu = 0, .codec = 0 },
-	{ .cpu = 0, .codec = 1 },
-	{ .cpu = 0, .codec = 2 },
-	{ .cpu = 0, .codec = 3 },
-	{ .cpu = 0, .codec = 4 },
-	{ .cpu = 0, .codec = 5 },
-	{ .cpu = 0, .codec = 6 },
-	{ .cpu = 0, .codec = 7 },
-	{ .cpu = 0, .codec = 8 },
-	{ .cpu = 0, .codec = 9 },
-	{ .cpu = 0, .codec = 10 },
-	{ .cpu = 0, .codec = 11 },
-};
-static struct snd_soc_dai_link_ch_map default_ch_map_1codec[MAX_DEFAULT_CH_MAP_SIZE] = {
-	{ .cpu = 0, .codec = 0 },
-	{ .cpu = 1, .codec = 0 },
-	{ .cpu = 2, .codec = 0 },
-	{ .cpu = 3, .codec = 0 },
-	{ .cpu = 4, .codec = 0 },
-	{ .cpu = 5, .codec = 0 },
-	{ .cpu = 6, .codec = 0 },
-	{ .cpu = 7, .codec = 0 },
-	{ .cpu = 8, .codec = 0 },
-	{ .cpu = 9, .codec = 0 },
-	{ .cpu = 10, .codec = 0 },
-	{ .cpu = 11, .codec = 0 },
-};
+static void snd_soc_clear_ch_maps(void *data)
+{
+	struct snd_soc_dai_link *dai_link = data;
+
+	dai_link->ch_maps = NULL;
+}
+
 static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
 						     struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_dai_link_ch_map *ch_maps;
-	int i;
-
-	/*
-	 * dai_link->ch_maps indicates how CPU/Codec are connected.
-	 * It will be a map seen from a larger number of DAI.
-	 * see
-	 *	soc.h :: [dai_link->ch_maps Image sample]
-	 */
+	int i, num_maps, ret;
 
-	/* it should have ch_maps if connection was N:M */
+	/* N:M connections must be described by the machine driver */
 	if (dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
 	    dai_link->num_cpus != dai_link->num_codecs && !dai_link->ch_maps) {
 		dev_err(card->dev, "need to have ch_maps when N:M connection (%s)",
@@ -830,24 +787,38 @@ static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
 		return -EINVAL;
 	}
 
-	/* do nothing if it has own maps */
 	if (dai_link->ch_maps)
 		goto sanity_check;
 
-	/* check default map size */
-	if (dai_link->num_cpus   > MAX_DEFAULT_CH_MAP_SIZE ||
-	    dai_link->num_codecs > MAX_DEFAULT_CH_MAP_SIZE) {
-		dev_err(card->dev, "soc-core.c needs update default_connection_maps");
-		return -EINVAL;
+	/*
+	 * No ch_maps provided: synthesize the default 1:1, 1:N or N:1 map.
+	 * The N:M case was rejected above, so one side is always 1 here.
+	 *
+	 * Scrub dai_link->ch_maps on devm release so a static machine-driver
+	 * dai_link does not carry a stale pointer into the next bind.
+	 */
+	num_maps = max(dai_link->num_cpus, dai_link->num_codecs);
+	ch_maps = devm_kcalloc(card->dev, num_maps, sizeof(*ch_maps), GFP_KERNEL);
+	if (!ch_maps)
+		return -ENOMEM;
+
+	if (dai_link->num_cpus == dai_link->num_codecs) {
+		for (i = 0; i < num_maps; i++) {
+			ch_maps[i].cpu   = i;
+			ch_maps[i].codec = i;
+		}
+	} else if (dai_link->num_cpus < dai_link->num_codecs) {
+		for (i = 0; i < num_maps; i++)
+			ch_maps[i].codec = i;	/* cpu stays 0 */
+	} else {
+		for (i = 0; i < num_maps; i++)
+			ch_maps[i].cpu = i;	/* codec stays 0 */
 	}
 
-	/* Compensate missing map for ... */
-	if (dai_link->num_cpus == dai_link->num_codecs)
-		dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
-	else if (dai_link->num_cpus <  dai_link->num_codecs)
-		dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
-	else
-		dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
+	dai_link->ch_maps = ch_maps;
+	ret = devm_add_action_or_reset(card->dev, snd_soc_clear_ch_maps, dai_link);
+	if (ret)
+		return ret;
 
 sanity_check:
 	dev_dbg(card->dev, "dai_link %s\n", dai_link->stream_name);
-- 
2.53.0

