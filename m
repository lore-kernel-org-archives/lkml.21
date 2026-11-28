Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857992;
	b=w+ai0RIiZSAuPdoW5Y1T56yRZuTT7rzT39R9LGyfNv9B135TAQukt2G4J04sIvzyULtk
	 FXdDLzIpXs7Mekxjr4hwUkqsnlfmYniyVpR067ZRTTyZzK2Ahi23ByCY5VAIUYr0AlBzt
	 0VRZChFAZTR2vz2+vAS+lQro/4QN7GTaWP4hi04ishsIAObojDmlCZi9pz0sDaT7SxPbW
	 04EIvVV4t3Xr/C62aIPLE2biEnouO4DRLOb+K6JoTqFHXr5VE6bLsxAYXtJ0t2FnnlJMd
	 q49RbLAGYTyj8X+04ZPZpK4l5VgpdU+cJyYMLlbVMfYBqrr1bxvhb2DvELWZPCn9GoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=tdLkNGqwXWjcjO6fjZ/pKxrW+PPoYQ4yhJUHrTAmaIc=;
	b=mORQi6OGAsAc51qsmQAapJobsZVZcZxI3PNVs6v0ju8GQVXugJOwfhMx1RjgwToN5a3D
	 2BpJ4+jazVfBlt8bDY/0dsC/oh+yGgv85n8NtdfHVmWYZ/tAruRURuTbXAGwImR2rbrpE
	 WCUoTSe1uDT8pGHq0VUua7P6No6NUjvFhzl8vsQryk1TdhNpjGa+/IoxD8H+80G5ElngQ
	 ESbI98XMk2XKMsJNwF6oq5f5TnSxsDYuCfq0KfdAvOgwpSNBq/17LtYcH4Hh7GNpBLU8Q
	 gmSBg5nmHIqb7kUrFPxXZ+MtKAAOgOxXo4w0Qjzb8RUwz2m4b42VUmszyEMznToYjdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=XCSibyds;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB63606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB63606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=XCSibyds
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b4fb5d96b3so134489437b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795857991; x=1796462791; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tdLkNGqwXWjcjO6fjZ/pKxrW+PPoYQ4yhJUHrTAmaIc=;
        b=XCSibydsurMTONfd9P0H4TNm1a4sevJgxr35dF/UJ6OpmvZVzrGQDKYR9P+uW6smgB
         tkWrFWE75OQdALnvjKTHHe4p4YeZjEpcUwhZFrSeUOZUC3Gi1m8SsBq+o6lsQqBUpsst
         eaORUg1tiO3IhYzxVLMpbBNp/eEl3UICcmxgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795857991; x=1796462791;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tdLkNGqwXWjcjO6fjZ/pKxrW+PPoYQ4yhJUHrTAmaIc=;
        b=BZ4PqVmf8oewtXmF2aLCAHSS3J2UOWEjfny2R+GmnVXmQTNFiSm1uLWb+gXdVSRdNk
         hudqr/DMDFhG7Vxl9No4vu20K6DLPk9FNu78iXg1J+/UtoP6vOJIqRZOqpwkU1PiQh43
         eNjm/lWfX0ico64w9qV13SHr+/i+JTZZwZasOO+5kBfBI3yGW8PEEahCvru8vAdGR4QK
         wc+r1gsyCO4iPeysW3RQUEoggRUSLWqX8SzRrR8TdutfSQXe5dQmbjWLUps4mPQ6AEU9
         3kGzzbo0wspUhTSPMpjVCeQCzHZCRokijfdlFOXvyNzk4YAZSDZEJfObRrchJH0UdbmA
         0iWA==
X-Forwarded-Encrypted: i=1; AL+hErG/9BKCLiMWfVMps+T4KGe7MfPi7Ofh0j0AK/+cv9WFjF3dMypgySFF4e5uRdu/spQAeMDOJ3PO+BSQW7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EneNS4VSeTp543oPgcr+YeF/6VWJnC1YqmjxBCp+bTuwoAVQi
	cWSTltt2nb9fnQz3AeL7axSrQ3hwcyNMgtw1ZD0JCMNIPwYs+IEU5/040aItHTy/keQR5lp1V7E
	oVTkGqKnCcfpp1m4=
X-Gm-Gg: AZFdTZelccrQyQjT4NUqFb4LV5rL68WZKVwmS3MKf0TZm7SUsHKx5tiKf01Nxfgxg8P
	EuitarRvERjHPBOxGdSEu9KbT390sfK8TbbBby31UFe4wMObnVSi0k61DU7ziKatpxZooG/WXJ6
	A9ZZ0J1YKFenaH0kKTuYLlfZD2WANPEee4IHOQljPw1dE9xknkNECbpvmuxbVtd69apWzh5lu65
	lsDPBH9HjMwxYR6a5Xr0mwCEMd5ITAdFYFo3zJuhd/v31y5CI2milIm//kuiF5ub4pMRGf0eIgp
	awSaqVQQhzQRwNUgDgheWRhLQuMjGQWaXBOrQMJA6sVsgusuF7p8NO93a1saC5OmMQ7I2X0c+DD
	VrOHzlHc36YvoBD/B2Qy98ANatScb5Gzial8xBk3wB3wHsO2aWmnInzC2wuZpm3VUBeJusN1dJ5
	gelHQmc29rPkKuLnmu1yCMl8jl7N6aJPSAdFSiw9M4Wtb9hwjeNNJ4XqP2XM1x+woBMmpHZxK9k
	xP1gR2n5xflZruIQ2JDBk5lavbelt0qoi1y8kEFTJGmKf6GZIb8Bq+pD/nRTYts35eMYpw3TP0M
	tznvPqMC07jAtipBc4O2tygDgh0K4pUk2HP0DcSD5p3tgxY8nr2wmDUd2MuPoZMMdTTgJKL2IIt
	ezbctrrr9wiBkVQoWYBdNUlsYMLFGD3pEdWtoCWUdTK7y+WzLt1eM/hXK33ref/LBUzJHemZ9Zx
	38xlUUKLbEY0rg9ngJrUL4rKJhFjXeBhenepm5emN4wfCtzTbfxlluXTOh6autTPglvEdDJGqQN
	LlSl2eJeTgJaeJUAw+8nQk=
X-Received: by 2002:a05:690c:6d83:b0:8b1:6c4d:6b83 with SMTP id 00721157ae682-8b518f1cf54mr110028987b3.24.1795857991028;
        Sat, 28 Nov 2026 01:26:31 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201bb6c7sm104732457b3.6.2026.11.28.01.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:26:29 -0800 (PST)
Date: Sat, 28 Nov 2026 01:26:29 -0800
Message-ID: <cover.1795842371.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 0/5] scsi: sd: Fix WRITE SAME(10) data corruption
To: "Martin K. Petersen" <mkp@kernel.org>,
    "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Cc: Christoph Hellwig <hch@lst.de>,
    linux-scsi@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

With scsi_debug and 512-byte logical blocks, a 1 MiB discard at 2 TiB
succeeds, but it's the first MiB of the disk that gets discarded. This
happens because the starting LBA wraps to zero, because it doesn't fit
in WRITE SAME(10).

Write zeroes can also run out of bits for the block count. With a
0x20000-block WRITE SAME limit, a 64 MiB hole punch sends a count of
zero and leaves the whole range as it was.

Let's only use the WRITE SAME(10) modes when a 32-bit LBA can address
the whole disk, and keep the queue limits and the modes in step so that
requests fit in the count.

v2:

- Don't select or accept the WRITE SAME(10) modes when a 32-bit LBA
  can't address the whole disk, instead of checking each request
  (Christoph)
- Clear max_hw_wzeroes_unmap_sectors when the zeroing mode doesn't
  unmap, since the zeroing mode can now change on a resize
- Change the modes with the queue frozen, so that queued requests are
  not sent in a mode they were not sized for
- Disable discard when the granularity is above the discard limit,
  since the block layer doesn't split discards in that case

v1: https://lore.kernel.org/r/cover.1794069087.git.chris@chrisdown.name

Chris Down (5):
  scsi: sd: Fix stale max_hw_wzeroes_unmap_sectors after a mode change
  scsi: sd: Fix data corruption in WRITE SAME(10) write zeroes
  scsi: sd: Fix data corruption in WRITE SAME(10) discards
  scsi: sd: Fix WRITE SAME(10) count truncation when the mode changes
  scsi: sd: Fix unsplit discards when the granularity exceeds the limit

 drivers/scsi/sd.c | 75 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 66 insertions(+), 9 deletions(-)


base-commit: efd68f17acca65f581b9f2fa9ba50c8643ab544d
-- 
2.56.1

