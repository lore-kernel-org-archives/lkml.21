Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436551;
	b=C4izdZNuhf9fM2gwEmv25ieWwFO1u2kPsIAUv5x0ZZj5F1sY9EcKxZNTqCViOQ/FnQVS
	 3AZaGPp9GX+XJU/N+CyO7x9amwMm5O45TzthVJuO7RcW8JLqiQOUlgiz+2V3HqZoPwjMn
	 uxAXfhPk1bxyoVVhdQ+9z/VWMBYmGmmI+Vt94SwWaVmhsaGlSOBoEE85gXXXACqx5h4pd
	 M/kUpnmz14/MMLRLz00TmZ1V4NgU1CJ3erjveH7k2jJ79HIzKf6uh82vuiYzp1tDRq3pj
	 KFhfoN3zctByUwAPsq2s/RgIWJ/i3VS8wqljdvJz6LcRbUZFlYlX7TZL2AcmcTyctDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fHN89iqHMglA6tA6YLX3To+FpptgLkpu1uDNq5dshLU=;
	b=pG5nechzRs15KMBwdDj6Ekn8FYktVDHxEIXwnK+rrPa90RLyCWv8rqtU9pGeUmlKUUSv
	 UWeQbdTIMJFHuY9SlvMEWULPfmuqlO4YvF94Eg3Tzd+0XmPTmeeREVpNfc96d06HEQypU
	 gRz0EOlPXWIcUZlFZH3eQx88Nep7Yx3ekds2uNoNbtn/WsIIw7TKARmzUBLGSN+MOG8XR
	 goRIEhB8qRUBq3vryO0WDw8OmVOgfCX4fv41YnvFmxkb+tjlgqqs5A2M4V78J6TM+vrXQ
	 wjgiOh8SXCuYs1BvXVzS6f4+epnWFFrl64EeABpneP3qDPnntYqc0KEi1bmgJEXPkqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7t6IXZt;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF68E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF68E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7t6IXZt
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3889256c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436550; x=1796041350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fHN89iqHMglA6tA6YLX3To+FpptgLkpu1uDNq5dshLU=;
        b=U7t6IXZtk6zDYj1kYU4ifCwoGPds3NnmOGfKQDlpCKCFJZz0pnusthn1W8K8J/algb
         dl9AAwYGfGFsi2/iGeBuByw3A5mxadWvxum8hR6PrqPHdYQbZBiOIcO7QbAb87oO/XXv
         WoLp7VMVG18bHdNPXIb3sfuLFOZSRce/PmsyxwXPhuquIqaSTiGqvAMaSss+5PBrd3t4
         XygyVVkKwekXhWX/AzfBy9T3f8WP/IikpL+5k0DGA2QneIMRqSxnNv4U7N3tRS698zZu
         G8/R1L9mzZK2v/yZx5nk5wJKu9EP8COZpqVvj/k8KyXEu6uPazpRhlbzQMHu+U9x6P3o
         9gcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436550; x=1796041350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHN89iqHMglA6tA6YLX3To+FpptgLkpu1uDNq5dshLU=;
        b=AnsxSC8T/VwuYLbqlq79cnceu/w5AM1nYJAqiqhDG492wv7BE4+jxOcR6CacrJAE9t
         Xsut50iybOkQc5ZxGcwI2EwhlxTFv7uLmYPjt8dbwn+DOljTh221Qy4uAgxtms67mkhi
         BybgVZSNKttU1yR5qip0B9A1O1Wc85ZmMdi5m4gm46zqjxTpTKA440g6e0dmjnkZFa69
         /36NtlvKcvip2j+DW6YLbZRvs8mm6wKFkIClvpQ6vfDGTRdv8VeBVuN+sN3ukgVGIWqi
         yID7NLxwi7m5a5VRiOKc4TEUTXkg2POGKyidJkn/ztOk8PQc5p4fnfb/9DIkbvUqdunq
         TCyg==
X-Forwarded-Encrypted: i=1; AL+hErHhHqUBWci0Ms5tMoaZj1zr/enAAA3UZLdC5Zwqiy6Xw1VQ4wYeuhNzFwK5p0t7BwbyhAwTZrbKOKsrP5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y50CpffZfnnjZBK3KUpedpsSq1/0pD6eKudOzDSqQQxA4+KhT
	Bv/9wpnBa/nBrUOvegvwNh2WmKLPM6QovT6z2yCJvrewf/6kLDHCYIjwmxWvPpgC
X-Gm-Gg: AZFdTZcqwdIWjUyeNtNlAfGPiaw2WKYy5AvG5n9oU10BBAS0XKSVqfNIe0QNlSCmmZ1
	GCEvfG2XrIL6DMmZ0JvdmW96rwze+s3t/CA5bn2WlW4H+74x6iO+lcUAXLAiS2AASshZ0JDhtCd
	J6fcDxQU1I2Jx3os5FT6Q8VSfeFfhNOk466yGpNIhe1Z5exrgtUr42xQow+lmPEuZidJmNWnC/j
	fDEIxx7IjqjIrngLcF7Uc+WuKZghLD1G1Z5egBhJqYUkWA+6j9X3pHWtegwnDWfYoGeOuJBabpn
	DRTlMBxKrQhMkEMd21IEodoProiT/B3swgb1sR1wLgdAqoY+FHGtJEhb1GcIAWvOPug0t1bDie1
	51illS0pqCfe/+k/Km8F9Gf9KoV41FeH+imsVZuR5fpCGBExYai1dapWdlxHGcbPlQOmKmzcGOl
	cq+T+SA+FhY6gQI8wZdf2wMOSpPML8i3uBarOKt1oRt6mFhh4toLw0EFfHfGjuUE7sYlaSwO+xL
	C08HqBNvvvY5jHU1pzs+/ws6KMulNjvbnAPK3d6xyYhI7bj/rhJ+JaIeobWEy9pG9G/iuGCugEw
	qyLby0HsHaDtqAa4E+e8
X-Received: by 2002:a05:7300:8807:b0:369:5583:bf4c with SMTP id 5a478bee46e88-3856ff5bb62mr12060416eec.28.1795436549928;
        Mon, 23 Nov 2026 04:22:29 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm25173398eec.1.2026.11.23.04.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:22:29 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Huth <thuth@redhat.com>,
	Weijie Yuan <wy@wyuan.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 0/2] drm/amd/display: document two members of dc.h
Date: Mon, 23 Nov 2026 12:22:24 +0000
Message-ID: <20261123122226.4101191-1-takano32@gmail.com>
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

Two undocumented members in dc.h, both reported by kernel-doc: the union in
dc_probe_status has no description of its own, and the comment of
mpc_color_caps does not mention max_gamut_remap_coeff.  Both patches only
add comment text, so no build was run.

The diff is unchanged from the previous posting.  As Weijie Yuan suggested,
the AI disclosure moved out of the commit message: it is now below the ---
in each patch, and it is also in this cover letter.

v1:
https://lore.kernel.org/all/20261121041427.1743954-1-takano32@gmail.com/

The changes and the changelog text were produced with an AI coding
assistant (Hermes Agent, model deepseek-v4.1-flash) working from the tree
and the git history.  I reviewed the diff and ran kernel-doc on dc.h before
and after the change.

TAKANO Mitsuhiro (2):
  drm/amd/display: Document the union in dc_probe_status
  drm/amd/display: Document max_gamut_remap_coeff

 drivers/gpu/drm/amd/display/dc/dc.h | 2 ++
 1 file changed, 2 insertions(+)


base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
-- 
2.53.0

