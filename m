Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810473;
	b=4y2vD850/RBQx8OQLktgzOntfaLTxF1xQOrdrLG5UJi/U+rV/bQgG9ZsWTDRFV94A8If
	 NYrSd9WCaQdgB2nVNt7wroPUq8pmWob5O94I15hxAkyW5/Lge7HPHEmFGO59OG3LcT9Gw
	 E31L8nRaHqBMLVt6PfIqdjLzHnCcIQ1ax8Vzew9Qb38Ho0LxNQR2BtvnqWjIv0cGACtC9
	 Y9W7wPNejqWexRy3YVlshZ6OVsFXH1ixdbxKRYGpxU44pMQOuXLh3eXlqFDiJ9mMyuG6C
	 WNOTUi2kAa48L2dLRubIvoflRMVHtDoF9PWWhv5OTlugu9cIirUkeMCwylu+qMrbBBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2tL8owTw2PwzoEHxqPksYuP4hbl3MRd9EfCtfzCRkZU=;
	b=x68DFCyTM8q3X8HNtux+sN7xRqxr6/OCY/6jM6ddnHAI2L5pHIxpo86+bJh91ZYET9n+
	 DWP5qdi/bv4iJVKOr2WEusfwYhGBjowPcyB8Aj/GyTb8GOEqkKJ32dpT1MQRGd0osrQje
	 8wC0KlrhWFErrRFUzNQZ6Rd4MsOr3RZoQwD3G4pC6OnAUZ8JexWlGkbJs6zVvbqXWitns
	 4agi8wFV4arJKg9aWxxkxDHdP0i8VaX7pP7R96DWQ0kuGGzGxWbCKq8wXrRQxdX+6JFPV
	 St8ukXelaSJqomaAH8I7SJeYszSqXMMVbyYhVdup4ASCas6a9tyjzE78lNIk73nfr2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7Ee4tcF;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A531606A335
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A531606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7Ee4tcF
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-380c28f9e35so9293652eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810472; x=1796415272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tL8owTw2PwzoEHxqPksYuP4hbl3MRd9EfCtfzCRkZU=;
        b=q7Ee4tcFLWvxTUg1AC9tTbuzOXSp+tXGbM/TXTp/ElJluabfKu+7TMjgFBL7tPHlCY
         J/LisMOFsSPJjMnG+xUtUNQrjXpgMqqkExts93dJ12cNMWhPD46PHCFJqvqGqSz0lRQ+
         5Vj0reUTUohffSCwbTE4+bme0Q+YAlWGfEQ9ENPdh3fS8MFDn88FMjrp4/ChNX5+LfaW
         T6F7jt+HXC7xTGVlmx/B+StLstm8Gts3vq+M9GW9EkpGpy1Iv5+bwugK1ZKEFLXC9O5p
         6mm/hQ1a02bwqTEfz0xUMob6zr20AFH4U3b37nc8yryimXs5qN0MdQGNoNm8VCxk4JDP
         eDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810472; x=1796415272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tL8owTw2PwzoEHxqPksYuP4hbl3MRd9EfCtfzCRkZU=;
        b=QzKLFeCJnF/LDtMtaaILbPcU5ysOGNGXEdiTEUXKzqf56YVAmESAyLg3ZyCxQD6hWo
         bl4Afwbh1/IgwwotEMPOXsJaJOsuG1GfmzNps/n2REsERDQ2iqehxGtPzBwT2hLtsQYm
         6DHUbNiNasbApnh9Y34kpmSTPiq2kFkdLZiUopdxT12dlB79qjFGekHnN1tFP+uFXuOD
         1RaNUMTzYd8cnRnkjHYEgipN01Ve/PhzhvK7Jv0tXtBbZhf/ASbLX6LHq2ISDxByuDqQ
         +h4zcA0DpHAMbmBHCKCpXQQBQG8Jisnp+j/qKBaTIsMhdcdPEgTMLBSAjspu7AopyBMV
         DSPg==
X-Forwarded-Encrypted: i=1; AL+hErE1w9kRWqU/Ui2yfmZeON2CSnA83O1seO3VhFOK4+B6hCq/ySeuivkrU2Kbv0CGRgAkgpncC+syTJl/0Tg=@vger.kernel.org
X-Gm-Message-State: APuU4Z855VYLnlFWZAccvl6f5aLeOSA2otq4zGa3U6dHMiJYR8dtH623
	oYRTFN60Sx8swSIyQcsPach5uspdqjV7Lkhd9qkkkZf2+LkR/SUdpfiV
X-Gm-Gg: AZFdTZc6xR7d9uxrqWrtLKDvPRlMyYveLSn+J/3xNIQ+VnYfty8X5MtlgnHQoex0m6/
	7/2atSdI0v1a8m3au+9uN97NH0GjU8p5jNfX6nsnpxJSmRmPDAGPJ3bjgzkHbm1Li9IugXDl8jC
	qa5tE60tdY5oLioSTKglhMruYuS8gqD5OJ5Dn0jZ4jZuJwYRQWpCgbWXtrAXQwtwXcdbN9eDE4k
	/OXXLck4z/OYS88vwXsTU5U1Dc92BETLzaxVG6GZWs9IsKKeJ9DthKuFN9PSBl4VH1YWbgaYeep
	kVOwI5hneus6yuOhzyyotNVhQE4LsV4ucsd7a3E1qrZzk1M4naNx4GhugF9tBBhY10BkhexK/r3
	p82sIY9wc+KrJ2oKFc2GPngKK3a4LuPgFBpubx0i1bG0lZ1Sa5E3IU0uhl6xaJhtPT2Pf2ROUd/
	I9SCu4g3xtIacEOxhPUGIe1J8jljJFc0qffHV/aA3ggg9Zo/6k/NSrGn+YAuV7VJZtBjiILnswp
	gJkELAVwaSLiBQk5OPiNF2QWjtMwINBJvQCybS/4r3kO/vjH+chFkJBjNquln+GMAe+sAhQAUVC
	hQ7Hh81dq3BSKK9BiTUDpYoMvkd8jesVRq++p5pTow==
X-Received: by 2002:a05:7301:d804:b0:386:b076:a940 with SMTP id 5a478bee46e88-386b076a9e4mr16325542eec.26.1795810472092;
        Fri, 27 Nov 2026 12:14:32 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm70396821eec.13.2026.11.27.12.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:14:31 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dan Williams <djbw@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	linux-mm@kvack.org,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v3] docs: Name the memory hotplug online type configs that exist
Date: Fri, 27 Nov 2026 20:14:28 +0000
Message-ID: <20261127201428.293257-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127190207.245175-1-takano32@gmail.com>
References: <20261127190207.245175-1-takano32@gmail.com>
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

The default online type is a Kconfig choice, so the symbols it defines are
CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE, _ONLINE_AUTO, _ONLINE_KERNEL and
_ONLINE_MOVABLE.  There is no CONFIG_MHP_DEFAULT_ONLINE_TYPE symbol, but
five files name one.

Where a file lists the config, name the family with a trailing _*.  Where
it names a choice value, spell the whole symbol out: early-boot.rst gave
the zone choices as _NORMAL and _MOVABLE, which are not suffixes, and it
left _ONLINE_AUTO out of the list of values.

Verification: a build of the tree defines
CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE and no bare
CONFIG_MHP_DEFAULT_ONLINE_TYPE in include/generated/autoconf.h, and grep
finds no reference to the bare symbol under Documentation/ afterwards.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v3: Add CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO, which v2 dropped when it
    spelled the values out, and write the kernel zone as "a zone that can
    hold kernel data (usually ZONE_NORMAL)" since the choice can land in
    ZONE_DMA or ZONE_DMA32.

v2: Spell the full config names in early-boot.rst.  David Hildenbrand pointed
    out that CONFIG_MHP_DEFAULT_ONLINE_TYPE_* with _ONLINE_KERNEL appended
    does not parse.  The other four files keep the _* form because they list
    the config, not one of its values.

    Written with Hermes Agent, an LLM assistant; the author reviewed the
    wording and the diff.

 Documentation/admin-guide/kernel-parameters.txt   |  2 +-
 Documentation/admin-guide/mm/memory-hotplug.rst   |  2 +-
 Documentation/driver-api/cxl/linux/early-boot.rst | 15 ++++++++++-----
 .../driver-api/cxl/linux/memory-hotplug.rst       |  2 +-
 Documentation/driver-api/cxl/linux/overview.rst   |  2 +-
 5 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec..8580099b98c1 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3948,7 +3948,7 @@ Kernel parameters
 			[KNL] Set the initial state for the memory hotplug
 			onlining policy. If not specified, the default value is
 			set according to the
-			CONFIG_MHP_DEFAULT_ONLINE_TYPE kernel config
+			CONFIG_MHP_DEFAULT_ONLINE_TYPE_* kernel config
 			options.
 			See Documentation/admin-guide/mm/memory-hotplug.rst.
 
diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index 0207f8725142..c7de458a962f 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -280,7 +280,7 @@ The following files are currently defined:
 		       blocks; configure auto-onlining.
 
 		       The default value depends on the
-		       CONFIG_MHP_DEFAULT_ONLINE_TYPE kernel configuration
+		       CONFIG_MHP_DEFAULT_ONLINE_TYPE_* kernel configuration
 		       options.
 
 		       See the ``state`` property of memory blocks for details.
diff --git a/Documentation/driver-api/cxl/linux/early-boot.rst b/Documentation/driver-api/cxl/linux/early-boot.rst
index 414481f33819..7118f3372596 100644
--- a/Documentation/driver-api/cxl/linux/early-boot.rst
+++ b/Documentation/driver-api/cxl/linux/early-boot.rst
@@ -34,7 +34,7 @@ which dictate how memory will be managed by Linux during early boot.
   * Linux Build config option that dictates whether the kernel supports
     Specific Purpose memory.
 
-* CONFIG_MHP_DEFAULT_ONLINE_TYPE
+* CONFIG_MHP_DEFAULT_ONLINE_TYPE_*
 
   * Linux Build config that dictates whether and how Specific Purpose memory
     converted to a dax device should be managed (left as DAX or onlined as
@@ -58,10 +58,15 @@ SystemRAM.  This will expose the memory to the kernel page allocator in
 :code:`ZONE_NORMAL`, making it available for use for most allocations (including
 :code:`struct page` and page tables).
 
-If `Specific Purpose` is set and supported, :code:`CONFIG_MHP_DEFAULT_ONLINE_TYPE_*`
-dictates whether the memory is onlined by default (:code:`_OFFLINE` or
-:code:`_ONLINE_*`), and if online which zone to online this memory to by default
-(:code:`_NORMAL` or :code:`_MOVABLE`).
+If `Specific Purpose` is set and supported, the default online type decides
+what happens to the memory:
+:code:`CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE` leaves it offline,
+:code:`CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO` onlines it to whichever zone
+the kernel picks,
+:code:`CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERNEL` onlines it to a zone that
+can hold kernel data (usually :code:`ZONE_NORMAL`), and
+:code:`CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE` onlines it to
+:code:`ZONE_MOVABLE`.
 
 If placed in :code:`ZONE_MOVABLE`, the memory will not be available for most
 kernel allocations (such as :code:`struct page` or page tables).  This may
diff --git a/Documentation/driver-api/cxl/linux/memory-hotplug.rst b/Documentation/driver-api/cxl/linux/memory-hotplug.rst
index af368c2bc9cf..df27520b193f 100644
--- a/Documentation/driver-api/cxl/linux/memory-hotplug.rst
+++ b/Documentation/driver-api/cxl/linux/memory-hotplug.rst
@@ -19,7 +19,7 @@ Default Online Behavior
 The default-online behavior of hotplug memory is dictated by the following,
 in order of precedence:
 
-- :code:`CONFIG_MHP_DEFAULT_ONLINE_TYPE` Build Configuration
+- :code:`CONFIG_MHP_DEFAULT_ONLINE_TYPE_*` Build Configuration
 - :code:`memhp_default_state` Boot parameter
 - :code:`/sys/devices/system/memory/auto_online_blocks` value
 
diff --git a/Documentation/driver-api/cxl/linux/overview.rst b/Documentation/driver-api/cxl/linux/overview.rst
index 648beb2c8c83..d567353e1dab 100644
--- a/Documentation/driver-api/cxl/linux/overview.rst
+++ b/Documentation/driver-api/cxl/linux/overview.rst
@@ -17,7 +17,7 @@ are generated.
 
     i) EFI_MEMORY_SP
     ii) CONFIG_EFI_SOFT_RESERVE
-    iii) CONFIG_MHP_DEFAULT_ONLINE_TYPE
+    iii) CONFIG_MHP_DEFAULT_ONLINE_TYPE_*
     iv) nosoftreserve
 
   b) Memory Map Creation

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

