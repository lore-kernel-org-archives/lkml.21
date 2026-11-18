Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994222;
	b=rNjyy7DNxQ11bU21jnyHN5KYh+bYqixLbnFw2UuHLTgj3PKBsC5snp0F4aofkNdZzhBW
	 wKLeW6kes7FfwsM/B/gTMXYGqtnHGuG9L8AmzUZtvvMUMD3iNLOqxvnEBvzQ5R+zlJd9P
	 Yo21v4JIrU5OodpFYpw6Mek4sSFMN/J0lwD8wexfcdzgdTHhta3mL9JlXMXJKbwpbpWdU
	 Epy0H+XjgKhDhZKTvCm83RA8nYnLV+qphH2uYPDjsscfEdvLorgXvNK3v3S5Mkw2gfUkE
	 cIyQde+iTbKJI7vYXF9yp6cN9r1L08Gc0lWiFbiU/D4qu66Vm6coD26ie8VkQIPj4Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bgDlX5QaMLg7y4b6FpejDiDYpseNWtykESeTKF63GOE=;
	b=w+Af6FLQn4tHmpvO6i9j2PbVi/Nz5AoY9+dgUhoZlEce3TPyyX/RRbid0qnURYW1nqen
	 Ue72+bAG38QHGxGFQbI9K01Bzb8lZZjr48AGS4BgHnmVRy9KBWRxY7DO/DB7YSA+DtJKq
	 Lq2kVfUkt/udtgJpEss2qo0lnoSRxYdnvH4oookg7e2WU1rNKll3orRK8zMe+6LV9irgK
	 /FUxMbdCYaD8yCVc5qyM/pgjbjyn4G3jbUB53BkJ1PraiQjHF1cFFfL94+igXKkmmLgU6
	 iSsFvCWP5N8TxU9T5i7fGCDq3NHf88MX7tJ5nAMvY9KhScr3uyAheEOhTmYCrJP3W9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XP20oGew;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FB4606A890
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4FB4606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XP20oGew
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492690dd5daso500867f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994220; x=1795599020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bgDlX5QaMLg7y4b6FpejDiDYpseNWtykESeTKF63GOE=;
        b=XP20oGewroSv1tF8eB/sB9ipVfwEeaZpL9Zd45zOBMEAW6vercjXlgXQaSG3zLI7Oy
         9qaekKp0ttWN/WrYa4lGtp4B8a4ihg8geBZUeyMl3w//gWP1Qzyn3MNkGgiYhzsZynpz
         J2IsPoRukeh6w8zftFHAc9QCx74KEbVSaeUT/lhVjYBQR9FgxXkAe6cBYCu9NR/YQqgs
         EaNWxa0bCdlkPI0wFGAtBqpo3qxSgQ8QARYzdfP2QySdSxUOohot1lWuAQWl287hrWjj
         o7liPM6cNbsntp8jc1n7wyjv1zQrLDUN1X8jCKiqclgpHoAON8OxFR12dHOWlcyj0oYQ
         8FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994220; x=1795599020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bgDlX5QaMLg7y4b6FpejDiDYpseNWtykESeTKF63GOE=;
        b=Ny4e5HX/IZ5h/XZGzohPDni65lbzQAM3aKGRI8wRYChbXJG3t3KeLOhCaNqKQ6yq4D
         64u0spIqScYkWnV1LuytKkq0KSwyeVEbLnAkoNfMuEpXj51HMQyFBTS+NcVSrh6x9hhp
         mzsdy4D2TtVOkZJpBfc1n4QLCpKiJcloR6b16j87pvD0yFgEOAFfG7gwQq8IcjNY1Vuh
         N2q4jQW0ocVv2mxPjj87cYP/ybH5cOTzFOp9wByK46Shrv9zJL81hltNmsDZB8q46fYu
         hRTBwv6TCeVoXOxEpjEIbETE03KBTA0P5N8tTG4HtKFoBIUU2hwmj/RghTlBEqbVFZRK
         9nMQ==
X-Forwarded-Encrypted: i=1; AL+hErEgUgH10lLRD5uv8Ija7wn4n/6KLgzFWAsokGFuprGbAA+WJ4OXtWEH3B2obzZMQmKq/2MciIcj/IaFuxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wfZyuMfy0lqbePB1egPHeZjgPIGmicMCcDEvhoG++/sNKm59A
	64+99eVPwroqICnPctM9rp5ptDUreKqG1ED0npwQ8X1qu3QA810c4u3S
X-Gm-Gg: AZFdTZelZIGK+v5q8YuyJoihKZEeAn3jL0syG1vIEBhrm5dMto5Fopx8aCeQPOg6Ex9
	8vqGgSMLkxL/JubFxxDGIw47v9F+hakNj47JAuUODbMTfXPhvX+V4LQE8qcYvkTvhkAO31qIpRB
	umFHCGxOnxtgABRfAVCbpOO9+jynMMpWKMK1a66ZnREq4PRZzn9y0Et0Vxsnos6PXJqlnfVQ4S+
	ZOz3fgEVuSm3vsa5WXDWPlQL/ZqyAyqdDUicDg57eDAoh5qskWEsKoAyMRcmgDwH9TsHjPh3Sa+
	yUtU0bsl7yzQ34tUjgDyxV3HWb+teAKeZp6zvtUo/m0F+zC39oDggw53ZmUSnhwnJzdTH5dIBVp
	EAIqvVhKomp1l4Az5a8VBpk77Pl2UVXGPRkfBoxk5zU+w4LkDsNruvKGTlXQ84a4G+R9NSvXKsP
	fvEV+GV0ninyAe8BujEDFRa+i203DCtFErpaRCb0xFFNzy3Ycic2eNgTGsVsdB5XQant1p5MXJW
	yMdiCYN7gGByH78ZmC9AtbR8C0FeSP70wybfFxCGSKjxkRKzOR4xCgeg+vcG7KNCNKNvlTe3ur6
	2plZo9echvUf8Plzv2N61UAaM7u+fHbwRxxMYNQiBdTOGkNtt0nYxyTkFub9bKYNanjIw7skQt4
	2W5KZ3bsHfMLlBODLi6DGGwhoOI4styhitLK7qZ49rqjoJxELzqwyl4/ShCO1livq0hSdTCUdhk
	7ltB/BLrhz0TmvnUseFo2JxC9wEz7syocnNyVmxAuI6FdBSaAcM8D7
X-Received: by 2002:a05:6000:258a:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-4a6390a0d36mr4218222f8f.23.1794994219972;
        Wed, 18 Nov 2026 01:30:19 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-c049-d359-3a47-0198.ipv6.o2.cz. [2a00:1028:8388:a84e:c049:d359:3a47:198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm3800503f8f.41.2026.11.18.01.30.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:30:19 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 3/6] net: mvneta: check the TX queue range of an mqprio offload
Date: Wed, 18 Nov 2026 10:30:09 +0100
Message-ID: <20261118093012.90121-4-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118093012.90121-1-pepe.schlehofer@gmail.com>
References: <20261118093012.90121-1-pepe.schlehofer@gmail.com>
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

An mqprio offload without a shaper can map a traffic class to TX
queues that do not exist. Reading the class statistics then reads past
the TX queue array of the device, also as an unprivileged user:

  # kernel command line: mvneta.txq_number=4
  tc qdisc add dev eth2 root handle 100: mqprio num_tc 2 \
    map 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 queues 4@0 4@4 hw 1
  tc -s class show dev eth2

mvneta_setup_mqprio() checks the queue ranges against the number of RX
queues, and against the number of TX queues only when a shaper is set.
With fewer TX than RX queues a range can pass the RX check and end
beyond the last TX queue. Check every queue of a class against both
numbers.

Found by an AI code review agent while working on this series, and
confirmed on a Turris Omnia (Armada 385) booted with
mvneta.txq_number=4. Without this patch the setup was accepted, and
the class dump as uid 65534 caused a kernel oops in
mqprio_dump_class_stats(). With this patch the range is rejected with
-EINVAL, so the class dump stays within the TX queue array. Tested
with the series applied up to this patch and with the whole series
applied. No kernel selftest covers the mvneta mqprio offload.

Fixes: 4906887a8ae5 ("net: mvneta: Implement mqprio support")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
v4: New patch. Answering TC_QUERY_CAPS with validate_queue_counts would
let the core check the TX range, but it would also reject classes
without queues and overlapping ranges, which the driver accepts today,
and it does not check the RX queues.
---
 drivers/net/ethernet/marvell/mvneta.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 06b5453543a1..76dfbc484269 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5277,7 +5277,8 @@ static int mvneta_setup_mqprio(struct net_device *dev,
 		for (rxq = mqprio->qopt.offset[tc];
 		     rxq < mqprio->qopt.count[tc] + mqprio->qopt.offset[tc];
 		     rxq++) {
-			if (rxq >= rxq_number)
+			/* The range sets the TX queues of the class as well */
+			if (rxq >= rxq_number || rxq >= txq_number)
 				return -EINVAL;
 
 			mvneta_map_vlan_prio_to_rxq(pp, tc, rxq);
-- 
2.54.0 (Apple Git-157)

