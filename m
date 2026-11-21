Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795280100;
	b=EI+TbQ/vEdE41/9p/GKHrrkjd14nSOLJ2POq8FQ9T4Y98q46LFtt5nH1BqpqqlBnrrMR
	 SnsBBZnEHlT2WGvltIb4f245LESC1AjU+aJseYs2qfjd5TXPYp6MJn/A/i0lr0XeIIFeF
	 9OA4TcDZ7mjipY+4d/Um1/n7JtUzoZEdAtjd6PvMZJZ2OZi0ZfZ8fxYr9fq5x462h/Okt
	 kh7+jEzCU0ETe9Vz2yU8AYx+ewewdVNAKRbnYD3gmCNWX2uIwptz+xa2fiIP6CleMV6F6
	 PUvyvb0Dyf4t2YBASd2w8Q9LsuoIc/MgAK456+LkMcdGWPogFwmSB36EJ/9RUwCGzGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=p4VRFPXRszZf9dXxkcrFMy0Ly2f9TrDiVC01Lr7U2eo=;
	b=VEwnFJLB5wUZcRReACSnnmkflk3qeSLm7RYelpAahRF3Ei/+oVSFKMZiWLX1FeQ8x48e
	 8kQf3AjlkrI4jIxBgX5uFlXl50dC7oWfBJtUyPxnmbYHHwK/aeiLyeL5lmTfj2zQM5WKT
	 I5IEjR7AekRQBnCLXHTmCkvzvQdUS4OSYOemO+WvwYrjr0lrJK13sF5aLhLiuhCdv8qMk
	 ytGAWE0eYhQiQz1l+0CVTnvWFkStn7UyBwJsOI4+eQ3vrJy7fQemwjOgWTkAPsrQ5Fxiq
	 xC+zPGQbZMr+OpFw+yJ3PGPzya0T0T4A+ruffKAvDl7wOw/PitSNPrRdGHp1Emp4fNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ntv+tyfo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D823E606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D823E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ntv+tyfo
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso434697366b.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:54:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795280098; cv=none;
        d=google.com; s=arc-20260327;
        b=Y9Ku0MOmzSddkFPnR8AgOfO3gt7ZygYzUA3AvU3zf6O4VHuPuIfW/eRwN5T9m5K4Hi
         s/OwrPzmLzJkHv4FC5whTXM82Hex/GjYLV3VJ8UuyRCuB/+svxgwJuJ/6IllsZxATXdh
         Cnowb7A/N7lKyl2qDQW5rWOSrBiCR5n7icPwhTomcq9bMNmNsuGhUe616VtfDUIyPdbv
         PosWAgHre5ABUHEsDLFmCkAFnPF8HDe/WwWBo4swI5SJPlVHLEoc2Rz7rP9nDS6SLZYJ
         iY6cqYKwje2CBV4Shpgs3gZmUyDr9EyzswHsfLBJ8+YpB0X6FYGHxxDij8eyQIjd3xSR
         vQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=p4VRFPXRszZf9dXxkcrFMy0Ly2f9TrDiVC01Lr7U2eo=;
        fh=PXfdsVQsdgNhDA9v2OogfSpRHGaHmQcAdc+cFmCJy34=;
        b=Y+zzQy7wUdr+7lL7OOzanHuxD3Te61HhDPmbxV8bWX/FcBx7W08M5/YQjnixgdgYqQ
         /iWN5P+xtGfWXhQVflA6wydI7Pggm16BP5jaEstjiRyw1zDoyVYcRQ10XGRX/9B08Y8r
         PjJ62Y/qLxFV+ayJ5xM13ujr/l9rno70ewxo94jKrJ8jCAty/Cc20rS/j15fEE6hZRgh
         eQOWetNA6X0G6ELU78nZgllJB+/tkTl9nafCAwkFTxXzszGw/anTtbUC3sccKL7hB5vD
         zDJ8JZN8Vwa5FAZ31luT4I8z/d+Rle/KiQUoAz36fXwydO/i3gkyMG31WU4IeIz8zf7H
         Mncg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795280098; x=1795884898; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p4VRFPXRszZf9dXxkcrFMy0Ly2f9TrDiVC01Lr7U2eo=;
        b=Ntv+tyfoGZrKdNVbzRR93la72PF6+CfgZUt3q8pplxGe0KIEQD332IQfH40HQvQn1B
         zYHV3V67lL5OFXv+ExjfbvGiowVo6BgkNycLr1LqmGKR5woeYOUgUQADNM43AZpe4zIc
         9TocEcT4LEkzWgwZdzjZCezBqB5Ilg+K+0zLB3EROmJJ3WXnijHGkq1qQkPgEDrxDubG
         SL2GELit0O7Dc9zRtlSGC1tdUkrtxGzcd08v67EIPI1NW34mIK5np3HkVwSlAKaFqWRq
         r5shaDT6Nr37jFyfuBeE4cd+J+uAwTtkt2MzyL/gXll1WSmXsOL/y6BLeaFF7xbKlDx+
         jsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795280098; x=1795884898;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4VRFPXRszZf9dXxkcrFMy0Ly2f9TrDiVC01Lr7U2eo=;
        b=1HHLEKfSsP22fYTs23u8oJ86olWR338OstBrR+N1nXKCzQp7L6WS8ICFKI1qZMv7Po
         VOV30dL50faMoIPClZHF5J3Mmj3iie/wxvp7AZYdUABdoGItH/ixa0vdoT9qGqiCzT8w
         QMKlfzawJvVUvUljxJjHZKqZXftJMfpLmzJz8/nR30SqdRB69whNp0QoRsRlifqb589n
         apCJxUEkUyixqH+EVV+y3MhCDgiWAc5rD7SixYZKgFNWj4aymV34TvYwx6byfga4H/p+
         l74MiHv6jU0Own4Q/J5CiM22UMPZRSUUlxDRRE21CNhTN+GnruN6Cisc1dM+t5pW16m1
         X5Rg==
X-Forwarded-Encrypted: i=1; AL+hErG5OaWa9AWafHgspHk7oeXxPhQQUrAoD3HEcU3AAX4SK8LQEqz9w/gV2TPTiQWva23tNIXlpGPtD5OHb4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MdhiJ2YKCiw5qDKAFsiGtA7qCJC57lyBwGKSaGrHo3Zt+jOOI
	jtilNn+4qJ1myDxMrYqlOG/H5icg+4PniktwJqN68k1xSshx2Resjx32TyrCJJEZkQGEFWzP7bl
	8NkfTkO7pMD1hB8jP8ba1gCBiWht50yWyaya41hEbtA==
X-Gm-Gg: AZFdTZcdTpmoQcgZTUPbiOsN34PjDeJP8+NfoyA9lbfYmJ9uV9Lc7xP2QxjgvAjgMiM
	OYkg7sJh6hjGIfuMK+C1bGZwhKe6g9GDwYIQyVLUG9S5JGj6pLVHjGS2XHcUUCybjIqeX8I5TOv
	obrOKQVGCOn9RAiyCPsEcQlln1szgQXNQuscoFnBnEiOzZx0CKxpinr+OtVL4GIX53m5Rqb959r
	9FxBSzcZ8MNzvMeB5KW7QVY9CUfKUQS1CVf5CVRJD3pkNFY1hWX6zvY4ipRYFElaszZ7xp9EVMi
	zjMQNZusgnGACJv1dFfRJRSLbNoSeJ62IIchQYo2Xs+7JVgIXrJLMTvUoTJhfQO4nepWXwjHkDK
	Iw3w6tYapJm+YL5IHhEq1Unu+gk/Oz8J6QmrJyrdxd8hMnZMn4VUzrVtRo+NFDTfqk+hV0PrKC6
	0hHKm9R6fDQw6NnODeb6HIMhVvTzUlBnQVMhytA4LimQHkjyX7
X-Received: by 2002:a17:906:730a:b0:c2e:1b6b:8b19 with SMTP id
 a640c23a62f3a-c51319443e5mr756376366b.23.1795280098016; Sat, 21 Nov 2026
 08:54:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Sat, 21 Nov 2026 19:55:14 +0300
X-Gm-Features: Aa3M54qjEMC-B19WwPy3mwsbI41xLRHwyJMCWJ-SqiNDvruJ2FeNFUQFuycHa_A
Message-ID: <CAMnMt5YdKe__Q3o3M-og5LnC0To0DOiX80nDosYKNfVbZg1QgQ@mail.gmail.com>
Subject: [PATCH v2] md/raid0: optimize stripe mapping with bitwise shifts for
 power-of-2 devices
To: Song Liu <song@kernel.org>, Yu Kuai <yukuai@fygo.io>, Li Nan <magiclinan@didiglobal.com>, 
	Xiao Ni <xiao@kernel.org>, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 450ebc4be1d31f25855c6771e67d27718ab6540f Mon Sep 17 00:00:00 2001
From: Herman Semenoff <GermanAizek@yandex.ru>
Date: Sun, 8 Nov 2026 22:43:29 +0300
Subject: [PATCH] md/raid0: optimize stripe mapping with bitwise shifts
for power-of-2 devices

In drivers/md/raid0.c, map_sector() performs two 64-bit integer divisions
(sector_div) on every submitted bio:
  1. sector_div(chunk, zone->nb_dev << chunksect_bits) to compute the chunk
     offset within the member device.
  2. sector_div(sector, zone->nb_dev) to select the target member disk.

For ultra-low latency solid-state storage devices, such as Intel Optane
(3D XPoint NVMe SSDs) capable of sub-10us latencies and multi-million IOPS,
these un-pipelined 64-bit division instructions create unnecessary CPU
pipeline stalls and latency overhead in the I/O submission hot path.

When the number of member devices in a strip zone is a power of two
(e.g., 2, 4, 8, 16 disks, which is the predominant configuration for
NVMe arrays), both divisions can be replaced with bitwise shifts and
masks:
  - chunk >>= (zone->nb_dev_shift + chunksect_bits)
  - disk_idx = sector & (zone->nb_dev - 1)
  - *sector_offset = (chunk << chunksect_bits) + sect_in_chunk

Store nb_dev_shift (ilog2(zone->nb_dev)) in struct strip_zone during zone
initialization when is_power_of_2(zone->nb_dev) is true, or -1 otherwise.
If nb_dev_shift is non-negative and chunk_sects is a power of two, fast
bitwise math is used with zero divisions. Arrays with non-power-of-2 disk
counts fall back to the existing sector_div() path without any behavior
or compatibility change.

In addition, annotate the bio split check in raid0_make_request() with
unlikely(), as standard MD devices already enforce chunk_sectors limits
via bio_split_to_limits() in md_submit_bio().

Tested on an 8-disk Intel Optane Memory M10 (MEMPEK1J016GAD) RAID0 array:
  - Random 4K read QD1 latency:  avg lat 22.06 us -> 21.10 us (-4.4%)
  - Random 4K read QD1 IOPS:     42.6k IOPS       -> 44.6k IOPS (+4.7%)
  - Random 4K read QD32x8 IOPS:  1.11M IOPS       -> 1.72M IOPS (+54.5%)
  - Non-power-of-2 disk arrays:  unaffected, identical fallback path

Signed-off-by: Herman Semenoff <GermanAizek@yandex.ru>
Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>
---
 drivers/md/raid0.c | 26 +++++++++++++++++++-------
 drivers/md/raid0.h |  1 +
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index 35e103f0c2c3..aeb305077a5e 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -207,6 +207,8 @@ static int create_strip_zones(struct mddev *mddev,
struct r0conf **private_conf)
  }
  zone->nb_dev = cnt;
  zone->zone_end = smallest->sectors * cnt;
+ zone->nb_dev_shift = is_power_of_2(zone->nb_dev) ?
+     ilog2(zone->nb_dev) : -1;

  curr_zone_end = zone->zone_end;

@@ -246,6 +248,8 @@ static int create_strip_zones(struct mddev *mddev,
struct r0conf **private_conf)
  }

  zone->nb_dev = c;
+ zone->nb_dev_shift = is_power_of_2(zone->nb_dev) ?
+     ilog2(zone->nb_dev) : -1;
  sectors = (smallest->sectors - zone->dev_start) * c;
  pr_debug("md/raid0:%s: zone->nb_dev: %d, sectors: %llu\n",
  mdname(mddev),
@@ -330,6 +334,7 @@ static struct md_rdev *map_sector(struct mddev
*mddev, struct strip_zone *zone,
  struct r0conf *conf = mddev->private;
  int raid_disks = conf->strip_zone[0].nb_dev;
  unsigned int chunk_sects = mddev->chunk_sectors;
+ unsigned int disk_idx;

  if (is_power_of_2(chunk_sects)) {
  int chunksect_bits = ffz(~chunk_sects);
@@ -338,21 +343,28 @@ static struct md_rdev *map_sector(struct mddev
*mddev, struct strip_zone *zone,
  sector >>= chunksect_bits;
  /* chunk in zone */
  chunk = *sector_offset;
- /* quotient is the chunk in real device*/
- sector_div(chunk, zone->nb_dev << chunksect_bits);
- } else{
+ if (zone->nb_dev_shift >= 0) {
+ chunk >>= (zone->nb_dev_shift + chunksect_bits);
+ disk_idx = sector & (zone->nb_dev - 1);
+ } else {
+ /* quotient is the chunk in real device*/
+ sector_div(chunk, zone->nb_dev << chunksect_bits);
+ disk_idx = sector_div(sector, zone->nb_dev);
+ }
+ *sector_offset = (chunk << chunksect_bits) + sect_in_chunk;
+ } else {
  sect_in_chunk = sector_div(sector, chunk_sects);
  chunk = *sector_offset;
  sector_div(chunk, chunk_sects * zone->nb_dev);
+ disk_idx = sector_div(sector, zone->nb_dev);
+ *sector_offset = (chunk * chunk_sects) + sect_in_chunk;
  }
  /*
  *  position the bio over the real device
  *  real sector = chunk in device + starting of zone
  * + the position in the chunk
  */
- *sector_offset = (chunk * chunk_sects) + sect_in_chunk;
- return conf->devlist[(zone - conf->strip_zone)*raid_disks
-     + sector_div(sector, zone->nb_dev)];
+ return conf->devlist[(zone - conf->strip_zone) * raid_disks + disk_idx];
 }

 static sector_t raid0_size(struct mddev *mddev, sector_t sectors, int
raid_disks)
@@ -616,7 +628,7 @@ static bool raid0_make_request(struct mddev
*mddev, struct bio *bio)
  ? (sector & (chunk_sects-1))
  : sector_div(sector, chunk_sects));

- if (sectors < bio_sectors(bio)) {
+ if (unlikely(sectors < bio_sectors(bio))) {
  bio = bio_submit_split_bioset(bio, sectors,
       &mddev->bio_set);
  if (!bio)
diff --git a/drivers/md/raid0.h b/drivers/md/raid0.h
index 8cc761ca7423..70b73511fb14 100644
--- a/drivers/md/raid0.h
+++ b/drivers/md/raid0.h
@@ -7,6 +7,7 @@ struct strip_zone {
  sector_t dev_start; /* Zone offset in real dev (in sectors) */
  int nb_dev; /* # of devices attached to the zone */
  int disk_shift; /* start disk for the original layout */
+ int nb_dev_shift; /* log2(nb_dev) if power of 2, else -1 */
 };

 /* Linux 3.14 (20d0189b101) made an unintended change to
-- 
2.55.0
