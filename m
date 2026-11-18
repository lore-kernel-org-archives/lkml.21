Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979019;
	b=G9Ila4yfqYZ/1suaPoT8eSDOeGYpKTNUgidOl4kwPQS6JNsBceWXs6Dp4JSTyYvXBUpr
	 4/2wFJ6L18aEsvg/lrehX/VD1w+6Gn6QqdiFrycBHN/KmtYROuBLw3R2NkE9Vfv+FEwTS
	 O2a7zOmUJjLyv4q8pAkDQEuRed8YLhtyCzh/Rln3vAYe/17McVhAKQPtKZ4R9W8MJDiSV
	 474k5w7l25d8oBYrFd3m6o3YeOzNNZaow5IaBFX3dULYi7NmVPTOKw2Jpn6ehFtwDXwns
	 YBx4chmDhMK6uVR5O9S/7pMLIVvADqKIgn/FMnS2nqwOp/5JBm2BDmndf0hXkiRtvVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qCTT5tE1AhTDSZqYcsIs/FSirloZ4VPfHTJpLpeUVGE=;
	b=RpTedRjwnhpHuiXm6Zkv6jG2v7MAVwnZJ1DwLOsuU+glnGYNEhfGixV9NUnrUDjfZU4U
	 r8r0TUIUtuxLvxzSuJkpkX+LcBxne23NPG4MHYymW+vecUGQpu9vtqJz1YxuV0NIw7Qy5
	 GMdFp1g70/ALJB2gxTrY2RbiN+dGhuaFyDcYgvqH1eBVgXbg8pZytkkb7SpQin5HHDOz/
	 XRdK7ZcqH0UI72R8kN8YIeRimbKlqQY45Bz7M76efvjiv2dzQLHCVpTuAy/sFLZv4i4O9
	 KmMgtLFbQ/gbeRuTI/MWlgGti5TrdC2jiIXCVQpUwYEuzn0n0tqzJ9KQVcIoVfBba8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dVskYKSm;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0099E606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0099E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dVskYKSm
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so5383035e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794979017; x=1795583817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qCTT5tE1AhTDSZqYcsIs/FSirloZ4VPfHTJpLpeUVGE=;
        b=dVskYKSmxtJLlTx0wqyBw1f/R7uMoyY64zWV2k0+RE6ELNPbwd0YDh7Fo6VdwyBIVm
         YcFtV1t2CHHSYRJw1uLpd55BxjgX4ER3wGXnW8yIRO2PTKLEvxwwhrVKt0UTXBRTiFTz
         JkiYXVhWbdA5g1UohpxcN9JCXYyDBPec4T+VlB9+4oDKODD3qflIGo7DjKtjCe724UcG
         d4TH8PCN4X6egl4pJxuomiT4k++X/iK6R7c5ajQ6rhsNLgw+n7g9HyHQLsXub7esAy6m
         lSC16qXqo2SiWBK9feEa4UMZrHCGMtOEzCDAlnpWqScykUpjbHsap1toAl/7I1zT6RLy
         yR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979017; x=1795583817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCTT5tE1AhTDSZqYcsIs/FSirloZ4VPfHTJpLpeUVGE=;
        b=Y4uKcyFbUujN5TXNfuC5mB6lWBMWZeDPLAFe6fdWptQ0hwiSiYoTlxj4dRkWmbvKDl
         52rN7zX7r9Cn6gaoRBOLgK1MeaTjlA+pO0Aq4/pQ+Ws0MdwPRLtK14ANUyaKYN2PUorg
         uilrfvHFDhqOqwFg2riW1e48jMS8LzRwfZviJot5o9zqdIto8Jd2N+qtsFfOG8sGHpKH
         CugQ4s9w9soN+HoWfeTUEGQlni56u0VUd/dkyaKpevT/chYc/XP9BoafDK1qDAqNZkSW
         cdKarPTuDiD5NNT6eKZ6D312brWmvLwSAB/qfGFeXz7uoaw91fEoE5KExsq2pK5L6A2x
         0Bmg==
X-Forwarded-Encrypted: i=1; AL+hErFGkIExsDGzXDUHLTN+sg0wf8+1R3tYA9S4NCOdU3s0a0xPwCLoGtqe1hx24L7vHdNs9wsD+iGPRhaKktg=@vger.kernel.org
X-Gm-Message-State: APuU4Z981o2YDZtwQLwBZ+ABWOAF8jBCRKVXcOb00JfAdcJTuT58xFOc
	zK+sAhYULXpeE+RDcrb/ZVWkqziINtM2phzzq/C+w746HQz3yphxS9k5
X-Gm-Gg: AYBFou2xTGS56fmU5Mq4hFaI2Szzl/2SZP8RWyWtoN5tiqHSVrO9p2Kjw5OGX36AXHx
	r377CdIXca6fQcAq+aDGW2rceyeCCVA6/wDgpSNKfTj0bd8ZCGPTMfPD0OwoOO+8k8CT/rjjaT9
	UQWd5xQgcckzMTeTr8ABYEKF0ZN6M1HN3BM83iZCsZ5G//ZtBq6Oa+oChdhjCwA4JKsIGQ41BI2
	/azYtxiOYX2UCOfc9q31gOosR95rXreelq6G864OVZwtBPpXS77d4HdUhGWOhRZ+6xdxz3sZeof
	qNWVO6b5TISqqMc7o6yJWdoqkH2JAud4SX1jow3mQsbKvYp4u6F2vbS7g3JbxHiAv4BFZbU7Tad
	efXUwMeZorC4HinyqROsRNrmti4CvkUz8h5BSErfXKPq/f2qTi37BeRe2/xUBoXmOfvYxQpU9MY
	Oj0e+/qySkHu7O1G6l6fAIAUg6eV7KTvoSpZnlgXO1X+cpwr2qmCM9TrpX+l2d2rX819H3QyW/C
	twRH57qw7N2pA3hWTGeZ9fV7WkaM857W14AngI4WyLtMRmRJ4BS7nejwL01LTyFwvkpAgIuwrSp
	EbHn6Vd6IForWDHrdDjbnDKgVWRKAUvnz2jpnTQEa+ndMB3sEU5rc8RpdH3YOx/jOtAwF/8uU8p
	APMQ98Hyqx1ATut7Dm/6lZAqI
X-Received: by 2002:a05:600c:4e04:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4bb7da18a01mr22383335e9.15.1794979017177;
        Tue, 17 Nov 2026 21:16:57 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.59.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78346f4asm122582685e9.0.2026.11.17.21.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:16:56 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: maz@kernel.org,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	fahad.arslan@siemens.com,
	haseeb.ashraf@siemens.com,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/1] KVM: arm64: Resume stage-2 range walks where they stopped
Date: Wed, 18 Nov 2026 10:16:47 +0500
Message-ID: <20261118051648.74580-1-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
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

stage2_apply_range() walks a range one block-sized chunk at a time. The
walker steps over an invalid entry in one go, but the next walk starts
at the following chunk, so an invalid entry larger than a chunk is
visited once for every chunk it covers. Each walk also ends with a range
TLBI when FEAT_TLBIRANGE and FWB are available. Unmapping the whole IPA
space of a shadow stage-2, as emulating TLBI VMALLS12E1IS and TLBI
ALLE1IS does, takes 2^18 walks with 4K pages and a 48-bit IPA space,
however little it maps.

As in v2, the walk reports the address it reached and the loop resumes
from there, as in Fuad's series [2]. v3 does this for every user of
stage2_apply_range(), as Wei-Lin suggested, so there is one loop: unmap,
write-protect and flush get it, and their pKVM counterparts report the
end of the range. The walk handles every entry it steps over, so
nothing has to be looked up beforehand.

An example shows what changes. Take 4K pages and a 48-bit IPA space.
The root is a level-0 table with 512 entries of 512GB each, and a chunk
is 1GB:

  Empty shadow stage-2
    before: 2^18 = 262144 walks. Each of the 512 level-0 entries is
            visited once for every one of the 512 chunks under it.
    after:  512 walks. The first walk under an invalid entry returns
            the end of that entry, and the loop resumes there.

  One populated 512GB region (RAM and devices low in the IPA space)
    before: 262144 walks.
    after:  at most 512 + 511 = 1023 walks: 512 chunks inside the
            region, and one step over each of the 511 other entries.

The example is derived from the page-table layout. Measurements follow.
The machine is an AmpereOne A192-32X (192 CPUs, bare metal, 4K pages,
48-bit IPA, FWB and TLB range maintenance present) running Xen as a KVM
guest. The workload is one create and destroy cycle of an 8GB guest
under Xen. bpftrace kprobes and kretprobes recorded every full-range
unmap (start 0, size 2^48), its walks, its range TLBIs and its duration.
"Before" is plain 6.18.29. "After" is 6.18.29 with v3 of this patch,
adapted to the older unmap loop, and with seven commits already in
mainline backported: 33346f8960c7 and e5843f4effaa (nested_mmus life
cycle), and a6ca6cba5959, c2778d14cd2f, 5491980c1a41, e6084aecaeef and
2064f15b0848 (guest stage-2 tracking).

                                    before          after
  full-range unmaps                    226            672
  walks per unmap                   262144     512 - 1023
  range TLBIs per unmap             262144  same as walks
  unmap duration, mean            905.8 ms        4.06 ms
  unmap duration, median          906.8 ms        3.31 ms
  unmap duration, min             842.7 ms        2.08 ms
  unmap duration, max             941.6 ms        45.4 ms
  VMALLS12E1IS trap, mean         899.7 ms        4.06 ms
  VMALLS12E1IS trap, max          941.7 ms        45.5 ms

Walks per unmap after the change: 512 (8 unmaps), 534 (1), 546 (366),
547 (1) and 1023 (296), mean 756. The page-table occupancy was not
recorded, so I cannot tell which layout each count reflects.

Patch 1 makes stage2_apply_range() take a function that returns the
address its walk reached, or a negative error code, and resume from
there. kvm_pgtable_stage2_unmap(), kvm_pgtable_stage2_wrprotect() and
kvm_pgtable_stage2_flush() are that function for unmap, write-protect
and flush, and so are their pKVM counterparts, which return the end of
the range as they do not walk page tables. The other callers of unmap
and wrprotect, in nested.c and at EL2, only looked for an error: they
now check for a negative value, and those that pass the result on turn
it back into 0. The unmap of a shadow stage-2 also drops the guest
stage-2 records of the whole span the walk covered. The TLBI
VMALLS12E1IS handler, kvm_nested_s2_unmap() and the pending unmap of a
recycled shadow stage-2 need no change.

Changes since v3 [4]:
  - In __pkvm_host_unshare_guest() and __pkvm_host_wrprotect_guest(),
    ret is an s64, so no second variable is needed.
    pkvm_pgtable_stage2_unmap() and pkvm_pgtable_stage2_wrprotect()
    return the error or addr + size with ?:, as Vincent suggested.

Changes since v2 [3]:
  - One loop for all users of stage2_apply_range(), as Wei-Lin
    suggested. stage2_apply_unmap_range() is gone. Unmap, write-protect,
    flush and the pKVM functions report where they stopped, under their
    existing names. Their other callers, in nested.c and at EL2, are
    adapted to the new return value.
  - The walks go through one helper that kvm_pgtable_walk() shares, so
    they keep its walk_begin() and walk_end() calls. v2 called
    _kvm_pgtable_walk() directly.
  - Measurements repeated with this version (the 6.18.29 backport of
    it). The ones in v2 came from its unmap-only code.

Changes since v1 [1]:
  - Reworked as Oliver suggested: the walk reports the next IPA to the
    outer loop, as in Fuad's series [2]. This replaces
    kvm_stage2_unmap_all() and its kvm_pgtable_get_leaf() lookup.
  - No extra VMID-wide TLBI: each walk keeps its own TLB maintenance.
  - Measurements added.
  - Based on Linux 7.4-rc1, the same base as [2]. It does not depend on
    [2]; it applies with and without it.

[1] https://lore.kernel.org/r/cfa77cdbf14d9fd24c22ab1ef9b940a0d7411699.1794229714.git.haseeb.ashraf@siemens.com
[2] https://lore.kernel.org/r/20261106133000.453240-1-fuad.tabba@linux.dev
[3] https://lore.kernel.org/r/20261110164706.582879-1-haseebashraf091@gmail.com
[4] https://lore.kernel.org/r/20261113080233.640539-1-haseebashraf091@gmail.com

Tooling: the patch was drafted with AI assistance (SiemensGPT). The
statistics were collected with bpftrace, using kprobes at function entry
and kretprobes at function return.

Testing: the measurements above are from the 6.18.29 backport of v3,
booted on the machine above with Xen as the guest hypervisor. For pKVM I
booted a 6.18.35-based L1 kernel with kvm-arm.mode=protected (protected
hVHE) as a guest of that machine, with and without v3, and ran a
non-protected 8GB guest. One create and power-off cycle made 11 pKVM
unmap calls: all returned 0 without v3, all returned addr + size with
v3. Ballooning the guest made 2097163 calls (4K pages and ten 64MB
memslot flushes), all returning addr + size, with no new dmesg warning
and a clean shutdown. That runs __pkvm_host_unshare_guest() at EL2.
Write-protect (dirty logging), flush and the other EL2 callers have not
been run on hardware; for them I rely on a user-space check of the
changed functions on random 48-bit 4K page tables, which gave results
identical to the code before the patch. v4 only rewrites how the pKVM
functions return their result and v4 is only build tested.
