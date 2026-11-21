Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795281918;
	b=LkzCQ7Mg/dPcQ9nA5B8Z+kb8scgxf5CJEa+BXotGuorS57ULxtO6zDBIhYLiy5grKLfZ
	 hWZLl9fC072t+rER59EMMJBUqzJezlD12IdzbBOcM+jupzbY/Fdr5MEkHcFUke4YmbVKl
	 arIhRYrRfcVP4ISgUFnkt+4u8rsbB1TBAEJeq2gcVYD20o4NLx1j2db9avb7zSE6U8eh9
	 31DdOGyftw16G5KbGHIZ8nAcCCcou1jJEMZIn6CaL0fFZLaj+h9GBGCQTAWESQksAodUg
	 XlSBmyX2/QE9fysL9xOiAJ27yCDKG8SHxUL0yZo/8SRIXOZJLlWTKp7xSypDb43ZHtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=jEVC9z3fKTdorHh4mzVaVfKrDjM6NNyS/otyoBpkmfM=;
	b=X/fy9P7F03Eys1JCO26gAOyAEefvgwnqcpdtvdClYM6X1v0D+oNNdu9hmcRCB0V24Vw8
	 f6VQ+jRKAkonAPgq7eM6AOuxr9KkZQIvDhszve1walfjLMkUfJUJ3JSD0ZqA3c6P/VuQL
	 aRbnHy6Rsspp99wFWer0M6dW4cnyxC3xpqXQ99WStJ+amE6/wfR6VuryKOD9ZWS/mjmmF
	 N75toli+o4De82ouVQrDs0DGuzR6UksomCwtpbeCMAlk/HN2dk9MTPFQYA3iFjAQaWw0W
	 SnS0B352lifPZtHhaSpCb0qHFYPAa+Xf7my5n9YP6u2RZ2YakWXk3HyBQjAz7W87I/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6Y9a7sv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21829606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21829606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6Y9a7sv
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so2526038a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:25:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795281916; cv=none;
        d=google.com; s=arc-20260327;
        b=OY/R1SWjhvYZKpAMkzHuR1TQ1YgPYF60Cy6xvohaxKkRKrX01SJSXv+JpdImpDlS6G
         xbSlgceGssVOVi1C/+6AnRcBCn1eayeU/bU8DOP5Lsi/viNiKzkZLym7wRpiuE+D1i6p
         g3lpx7wLOUz5MjpW8cDhNHK0GBS5k6Jk+NOx/KhkfD8yCWUVXWloy+wijUxY6oVgfTWW
         oj5xaXqY1ifSXFd2Zj6MHeY52ft5WFaDxiLbVz4r+m/ihzQDalTSttN3vrNqTt5hZ9Ct
         QP6o8J5QYd4+S8gPatIucwntjYbJftWDMfxwXomQlykphZX92zb/HHy/+uLHpVRWJHoA
         prKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=jEVC9z3fKTdorHh4mzVaVfKrDjM6NNyS/otyoBpkmfM=;
        fh=zFx8zLX+LWU7GhiU1vDrHOuXXgrSyI/HFBnvdDxLJLI=;
        b=lf9qdZ6POSYx7KtdHhH4Gf6ir5aPj9tkhHOPIh6JI/4Bn7JvoPHrWAA+E8/eYXx2wW
         GyChL1G84c/LCjV9fqF8jTmzCwJYB9+0qSi3LoI3K2QmHJsKIZUcKHExU6YolNjKbNFt
         NCGLtGOAreMrNG0dK/RXkOx94Jd5VrTpCSj3sUD+4dJkQocjMV6vcknNToeh0Yh+cT2v
         J6YL2O2UlPufKQYs/tm9K4mOLpo+ibfrJEEnVyLISAgDxIssxroKeegNEVoP6uFHeklK
         ByuS5RVghkwiN2RtH9NVSiYkvDu+BSYdubzeJ3Y3nQJjtbjaAU4JFqRFvXejng46Ya6Y
         wzZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281916; x=1795886716; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jEVC9z3fKTdorHh4mzVaVfKrDjM6NNyS/otyoBpkmfM=;
        b=f6Y9a7svjG0EyEwwrx0xhjyXCQMHAbjPLzlXgqSgV3RdK9zq2q1pgjPEnqqxR3efV1
         VnMrXJlgSYszaAVGh2Xnp3wuMmzRGfn8Lf9EedcTIdZL/PisRtB/+NO1L7CSbCW9GQcl
         76G37NuNS8u+7h7TPNhvzHNHS/jq2o52wfDdT/IAVLlHPYXAT5+yjSqbYWwC9YFcNEOB
         nRVuTLPHMgIF14QNgZSZwCtdZMmA0ZRySlkeXjhITL1z5JqyLekE3/ayLOD/mgXjVGqY
         Ew5HKpx+LrZKv8LCndASa8V32QBp/GOe/+DxHz/z+hnYWEGkulEaqcTeuAS/Qmf+ACBV
         E5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281916; x=1795886716;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEVC9z3fKTdorHh4mzVaVfKrDjM6NNyS/otyoBpkmfM=;
        b=yJaOpguvj24Q02hUObB9yVv/S6Cxfc71Qm/fux8RhhzK3k04HO1xlX9aRLOM9g+EFS
         GZrN2RvZS+kUSZ5I9dtI0EWZxna1Pbak4w5G40A216Z1ByQwgKEQ0twnJ7DzrtTigBtn
         +YyblRQPaEkipQGpcdbaYWw/bZgMCyiJok5S2IVYLU4pYBC+245k/7Ioi408NkTZYvXI
         B5aP6HWoO1YSbuRHCsPBl4aKkZLcWA+XDA/iy3lFAfvBS3h4JZ4DJMvjmWBoqzH04RCE
         761p2ht2YuN+AZZj319elPiudzrvWl1Z0+9Bg9YhyFhUpZv6UDZOFR4+o9Xyo5LpE60M
         sFkw==
X-Forwarded-Encrypted: i=1; AL+hErHAuFzxhAMS1Hbsrnfkp5FWxwJl/bmWSZyidAozMfcv0UVayoER5mI8JXigzCckEBXbLiP1NTBF6SDz+ZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DJ7uwUHVPgmNsbFYxXBUReSHNexLmDwdsNGm2KJAaKLHWeQg8
	hFsP/Zi99EpbjTo37qWm5BSGpQj3oGvuxqU/4nTslxCt60t19p2oNmu/BzjcPEtlsCCle9nde0y
	326ZMJct+nLrqNWcseHpW8Di8SZTVcx4=
X-Gm-Gg: AZFdTZfxwjIc/idlTl2vLo5Tocql6to8FNALU/Zd+T7UO9Nbu89nDJ8pHAgGBgE8ihR
	d4FQKJgDfUfcMXVY/YLnB6TpdhegWwwemLyz/jWnuI+spLInac1Nk3y1HkJZCa3sqzl9bgbUlhS
	z/Qzr/SoltBsLerDyCY1e7VFFJIZzXcc7NW9O/egTiodH1Ms0M6F2PcIHMrNZuiL4N1xkgvcGk+
	pbxDrUwdLJS3X3sU+N1PAHIOzTzUYXvaO1tNC2ZxBvmnQbJ+R9SBjOuthSikOr22EowYFOYmimu
	+difKJuWW2MmKRI+5kCX2bU/kNNbzcmGBb8PqXWmoKhb8wxXAU/VFr8zpcyb2lNmyM/UEUN6YSU
	LGvZ+FmgbuVEybl3ZqpV3nhFiOcRAJFOEuW66H8GaI/watIvZKhR0T2WsPdc0YNp5UDN9fnKYAF
	FaGJ/lAqEdIDQN2l0FqDSigxFQij7Jz36LhZUPqDEBGUquOsQn
X-Received: by 2002:a05:6402:a6cb:10b0:6b7:82cf:f6ab with SMTP id
 4fb4d7f45d1cf-6ba37e8ae50mr3382914a12.28.1795281916291; Sat, 21 Nov 2026
 09:25:16 -0800 (PST)
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
Date: Sat, 21 Nov 2026 20:25:33 +0300
X-Gm-Features: Aa3M54qKzxb3G59FpL5NAPHMGhwfKir0wVcdEZBT1nycH2gYN6zKK6d4CYnGEpA
Message-ID: <CAMnMt5bHeL-yk4hHmUYDC0yq6V5mxj8smkCPyGqjV-YnUBQ-xA@mail.gmail.com>
Subject: [PATCH v2] md/raid0: optimize stripe mapping with bitwise shifts for
 power-of-2 devices
To: Song Liu <song@kernel.org>, Yu Kuai <yukuai@fygo.io>, Li Nan <magiclinan@didiglobal.com>, 
	Xiao Ni <xiao@kernel.org>, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 450ebc4be1d31f25855c6771e67d27718ab6540f Mon Sep 17 00:00:00 2001
From: Herman Semenoff <GermanAizek@yandex.ru>
Date: Sun, 8 Nov 2026 22:43:29 +0300
Subject: [PATCH v2] md/raid0: optimize stripe mapping with bitwise
shifts for power-of-2 devices

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

base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
