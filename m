Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660533;
	b=ezmGYyu9pTH+qf1GCc0Hz0NAetDTJr1uaAqvNQdtxqjEBH6UVA3nDTwXZ+hzhDCWvaYt
	 22EB6SLeZMEweLvkxggniSoCuO3ZTnCu4JxJfIv40ZM6tJJ26qjp4N+Gxu4XAfr8vQqd5
	 URkF4Z244W+PMKMJYysskKE9PypEVmVfPeqsgfDdaVf/HRA5vVXXL6RVrbvvU62xNP2jB
	 KOleQFWe29dt/zM/55kOyEP3kbS4XKutmWHkxmgEh3Xfkd7COgyWfZWMSsNCVytBqnveO
	 5L4AjBGA7KjoB223T+Z0CzaFlgS27RQqCbqiDxef28Mgmz84tQPkIvs+TTR8Iph6zMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660533;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=TLKltpFTvCBeWSNaBoTW1xp096x+k2FfaL+MU1v8opA=;
	b=lAziHrBX1xCzY/20j9vlkCx+R03gUReeQzphw2uMdkc+dK9FS6nWb4UJ2McsoHhJHYz4
	 lgqDOI0GEhT5IdblQlEq/4M1ELQfQTT2fZPLTdSHeIE4yt48GmrF1TTln/TdBGZcPq4DN
	 vr7nvP78eIrwuTjrOh+Ek3roXd8mGDQglG35yLmBXhvnEuZ0wCzP0417WMK5Udd/uwBJi
	 XgSwdpVKk9eBQSzsAcJlvVabeoZbeeBhc6hzzk+rUuqniecjBXoiEhgOeM9yuLl3CY+Ut
	 PR3fYqQOs+j0pP5NFqHR1I7horxcYzX1m4CfZ3dq/RIEeXwX0ggtqJaEcK2Op5Gh4Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD67606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD67606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386d1859e1cso1118885eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660532; x=1796265332;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLKltpFTvCBeWSNaBoTW1xp096x+k2FfaL+MU1v8opA=;
        b=cGssNOOBmSzr7Ba5Wof0MfpkgJGoYfm/fGwwr7kET26iLNJkOPfE0kXTedBmnmEXDd
         8PC+Ww1a7FfHSVgwEKbbMF2n+3geWYpoRQCQMNOi6/9AAr7tCt0yWQ/qt7GbfPNnPUHI
         k4SCh0VUeESccpJYRXehhRzn2egDC16caOclIahIYNgAuV6A9u6ThCeGVWEb3U3f2RUz
         m89NxL8q3JTxKAtlIMq67K3K//LJQGwvnRxW8K9u7ZuqYxOXfJtfLilhZUZ8UhCW8l9D
         GCh8OVkB0eo7ymEw2gnVWATuyPSH+jVg6fBXEBXw+rFcbWJ999ZvKj2jK17/FVFSxv4F
         3Szg==
X-Forwarded-Encrypted: i=1; AL+hErHldC0MvZ7Kgl7lYOg5IR4rBKnM+pskXi7Hfo/aA8caJ99Ni8+GAKOX1kYMkybnBBNHz14MTRXNgFK7Z1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oSmBrSRvgjAQmUMACD2OnY3KkdxkVDDZ1MXzyEcwaBE+vFyUy
	cf03YJ/MaNF9TLWmNbaav6TsfJxH0dZFkKANClu7J6qw8GHXJqIAri4VVBm0h9cWUBiY
X-Gm-Gg: AZFdTZeCKJmouxmDPmvdGxxcNi33berca2DYomB/oeQ2TySrvOkR+72pStuLJcb4UTS
	SK/oMv53wbVkrghi48V9KITnAQEqq5HdzYot2iQEE/RBs7uJjfk2Sb5jlbDdUVCkTKILZXQYx1F
	eW5peBT54dSLJCtYN8Qa2ZgIml/15ymcOJNP/rT/JlAc9/dOvnxllw1e2PVPo2O2zOJKwYjRKRi
	qMx4taNqzrhu6aDQcgA8Jznz4z18g0h+WRNeGcb1RP2++Dtgumo2Ypahez7D1O1pZ4AkbgX0ccm
	tmddMvfyojYwNm+gqffZ81Wu3/h57r4Q+9H/NFXzcGIQvx6KPojnmFs2/9QNNmUul5OzTaSJmwc
	BPOZkBYZr+sRK+JBpYK5VdF0aYLQ5Pwc8ClNL1o4v2ZGOP7AYUzc+09sZ2PdZljsyvqPxC/w2So
	dxIr3CAyB26w5gXU6g77SndDdBFpK5IuX5tsRS/7Cv3zAY2r8gqhJCmosEh1mMEpovMEc0undC9
	ADNpzhtIy8oqigd1rNceS9dVzQ79fpbHon76B6DXO9+fE2F5yloxbYEkDJ04INERsqYEnuIdJiv
	TKS5YimCtZGlmHiMARvKYMlkWWymTDFXNOtIuArqyDd22uQCiQ==
X-Received: by 2002:a05:693c:884d:b0:386:d9ab:5cf4 with SMTP id 5a478bee46e88-386d9ab6c21mr1512813eec.3.1795660531373;
        Wed, 25 Nov 2026 18:35:31 -0800 (PST)
Received: from alanui-MacBookPro.local ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm26703230eec.27.2026.11.25.18.35.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Nov 2026 18:35:30 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>
Cc: Dan Williams <djbw@kernel.org>, Ira Weiny <iweiny@kernel.org>,
 Li Ming <ming.li@zohomail.com>, Richard Cheng <icheng@nvidia.com>,
 Ben Cheatham <benjamin.cheatham@amd.com>,
 Michal Schmidt <mschmidt@redhat.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] cxl/edac: Fix event record lookups for memory repair
Date: Thu, 26 Nov 2026 11:35:20 +0900
Message-ID: <20261126023520.39368-1-ai@linux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

This series fixes the cached event record lookups in the CXL memory
repair path.

Patch 1 fixes a use-after-free that Sashiko reported on v2 [1]. The
repair path reads cached DRAM records without a lock, and the event
path can free them at the same time. The DRAM lookup now runs under
the xarray lock, and the sparing path works on a copy of the record.

Patch 2 makes both lookups skip records that the device marked
NOT_REPAIRABLE.

Patch 3 masks the DPA flag bits in the cache key, and depends on
patch 2. With the masked key alone, the trace event DPA would also
match NOT_REPAIRABLE records and let them be repaired.

I used xa_lock() for the race. kfree_rcu() would need a wrapper with
an rcu_head around the record structs from the spec. Taking
device_lock() in the repair path could deadlock with unbind, which
removes the EDAC sysfs files while holding device_lock().

Changes in v6:
- Rebase on cxl/next (32af7819352b), no conflicts
- Patch 2: rename cxl_find_rec_gen_media() to
  cxl_check_for_rec_gen_media() and split the two tests (Jonathan)
- Patch 2: changelog wording for the online repair case (Alison)
- Patch 2: drop the Fixes: tag (Jonathan). Patch 3 keeps its Fixes:
  tag, so a backport of patch 3 needs patch 2.
- Add the Reviewed-by tags from v5
- Cc Michal Schmidt for guard(xa_lock), as Jonathan suggested, and
  Ben Cheatham as a CXL reviewer

There is no guard(xa_lock) in the tree, and the 2024 patch for it [2]
was not merged. v6 keeps xa_lock()/xa_unlock(), and I can convert
these sites in a follow-up once a guard exists.

Changes in v5:
- New patch 2: NOT_REPAIRABLE check split out of v4 patch 2 and moved
  before the masking patch (Li Ming)
- Patch 3: rename cxl_rec_key() to cxl_rec_dpa() (Li Ming)
- Patch 1: drop the found variable in cxl_find_rec_dram() (Li Ming)
- Richard's Reviewed-by on v4 2/2 not carried over, as it was split
- Rebase on cxl/next (e44dc3a303)

Changes in v4:
- Patch 1: copy the whole struct cxl_event_dram out instead of only
  validity_flags (Richard Cheng)
- Patch 2: make cxl_rec_key() and cxl_rec_not_repairable() static
  inline (Richard Cheng)
- Cover letter: describe patch 1 first (Richard Cheng)

Changes in v3:
- New patch 1 for the record lifetime race (Sashiko)
- Patch 2: General Media lookup under the xarray lock, returns bool

Changes in v2:
- Moved the Claude Code note below the --- (Dave Jiang)

v5: https://lore.kernel.org/r/20261108022022.3352-1-ai@linux.com
v4: https://lore.kernel.org/r/20261102123233.74598-1-ai@linux.com
v3: https://lore.kernel.org/r/20261101013418.87326-1-ai@linux.com
v2: https://lore.kernel.org/r/20261031161121.15948-1-ai@linux.com
v1: https://lore.kernel.org/r/20261030072721.31970-1-ai@linux.com

Tested in QEMU (master b574eaf) with a CXL type 3 device and a
committed region, on cxl/next 32af7819352b, with KASAN, lockdep,
kmemleak and preempt=full. Not tested on real CXL hardware.

- Repair requests for eight DPAs on all five mem_repair devices. With
  the series, 0x1000 and 0x2000 succeed, 0x5000 succeeds for PPR only,
  and NOT_REPAIRABLE (0x3000, 0x6000), missing (0x7000) and unmasked
  (0x1001, 0x3002) DPAs get -EINVAL. Unpatched, 0x1000 and PPR at
  0x5000 fail, and 0x1001 and 0x3002 are accepted.
- Race test: event injection from the host, four guest repair loops,
  and a test-only mdelay(20) after the lookups. Unpatched, KASAN
  reports a slab-use-after-free in cxl_find_rec_dram() within seconds.
  With the series: 600 s, 10,950 repairs, 274,946 events, no report.
  Without the delay, on the previous base (2101c39473a0) with the same
  code: 1,800 s, 98,220 repairs, 1,155,590 events, no report.
- Unbind test: cxl_mem unbound and rebound in a loop during repairs
  and event injection. 600 s, 78 cycles, 7,260 repairs, no report.
- kmemleak finds nothing after each run.
- edac.o builds with W=1 after each patch, sparse, clang W=1 (x86_64,
  arm64) and CONFIG_CXL_EDAC_MEM_REPAIR=n with no new warnings. The
  series also applies to cxl/fixes and v7.4-rc4.

This series was developed with Claude Code.

Thanks to Richard, Li Ming, Jonathan and Alison for the reviews.

[1] https://lore.kernel.org/r/sashiko-outbox-192042@kernel.org
[2] https://lore.kernel.org/all/20240228135352.14444-1-mschmidt@redhat.com/

Jongwon Lee (3):
  cxl/edac: Read cached DRAM event records under the xarray lock
  cxl/edac: Skip event records marked NOT_REPAIRABLE
  cxl/edac: Mask DPA flags in the event record cache key

 drivers/cxl/core/edac.c | 116 ++++++++++++++++++++++++++--------------
 1 file changed, 77 insertions(+), 39 deletions(-)


base-commit: 32af7819352bae9c690ebe277a44eceb501d5c68
-- 
2.55.0

