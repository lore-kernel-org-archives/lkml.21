Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635048;
	b=fsJJJb7y+xhkqQ+/8rMyi1ApGPAAZBLEM8Eg0nBSwzMJterwEluU8UGZ60iAgIwdWsVw
	 JTF2ZHfP6k9UIjd7wmKwjbibusHRrjOxZ/4CYu9Xx4BXb8q1PG4rbKSHrKQjlAwdXsT+9
	 +tytfJLiSv/Eid3v4TgK1lHb60c3IyOADpeBQHorKaIJw7FD9cnGbT0NEqPWwnE4NsbRJ
	 /wpUl2cj5HpxpG31uyALC7FAJ0xqHZnvu7fkM2GfHvlrPZuK534dFYepbYCGlUa0qboRl
	 KSr7EOBQMltpejY82459DlpuJQYxSV8neaA2UNuMBrgT7FakuVtb7Iy16kxKtVb8ljw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4c1FYCoWuV0D5AZnd9JhUkc3urYu3tiqyGnrAo0dVsQ=;
	b=VPaeHBS3PRc148OoBo/AkuuRHVbW4mq79YgOY6w3fc5ZmaoRVav1ZALHQ3RAQt3x4teJ
	 xw78XKMnRyToGeu0hgjW1rPdqkELZWE0fIO4uRYxzLx+jwY47k9lVkbmsv7DH3zo6O+vl
	 TJV4A2dLNgQJemtIT/KFVuKyLve+0NF8m4d2gPDklx0OpbnwsWjRPTMXODnCaLGnuDMwf
	 KxwpohEcFTAczzl2YTUYGCsrLFdTRzaighMVFozzfTjRkR6SHVlKnD2ZHSMBiNH+9T5vw
	 TyLLLJbJxIfphtNkuKAzn/JOxLt41DBvRKkjWM0o3KrYR9Dzy67tp28zdGIF4IpAEUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdCXUk2b;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4147A606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4147A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdCXUk2b
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f02ee04378so49708425ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635047; x=1796239847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c1FYCoWuV0D5AZnd9JhUkc3urYu3tiqyGnrAo0dVsQ=;
        b=tdCXUk2bln2JaFny46JeCc5ZMNDw/3+qR+WmADxAJaxlBXAqX0v7O+dGqHDQ7i9OSO
         HbGkyILfSoi2nqfk8zUQWh5tDLUrxLt3p6sOytd4oLf7WVgE71Wp5Lihy5FPwPFaBdLh
         AlZc4yBCwG/sE+NOF4koYCSIT//r7D3Kb041g2LQMvdiJa97tXnZREWzUbqsDTNvvk09
         t3r5BXnhfp4OWgjpsu7ninDi+MrCPp05mwXwwCH3+hMI10yLSwnsYAf2X+Vz71K2i1ps
         +D5udO8qxBudO1hPoqXH+t9LpgyRwdoRTAkmaN3dxj/FOvhXutPMEGExsJqi+wVE5f6D
         R3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635047; x=1796239847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c1FYCoWuV0D5AZnd9JhUkc3urYu3tiqyGnrAo0dVsQ=;
        b=f0lxhEsylBMiDVU5CqEreSP15ELpBRdDbucRHUNpCX5lO+5pxaVj9jPtaMvMZxet3v
         t3aXrFgClqYiPuuMZKOgyx963PNBa4muQl+Hvbnrrm9Vxh/XfDoLbOc7tThjjteziIFV
         293CHWpnG8SblErYyp2+bmRGnbq//K+fqAEjJbh/ODzCuiD5ABWg9nqp/Igh6Szpgo/Y
         48hhsMN3+JAWRyBri6JmFRwHwq6TpPAFB93oBVnW4l4mueFjATDLqh60m82XTrOwTlj/
         04LCvN7XQ3zlPkyycEjcigoZ84bWHOjCzSNmp6J74W8k6ZZZ088ZnIb8gcMm5+qVigZ6
         fLeQ==
X-Forwarded-Encrypted: i=1; AL+hErGYKjTwgeNS80WRU4HJdz9NaDxls3O+h1jdw9BN66S/K2MUlPwJ+TWemPEvcjri/G4YTAPSO2Z6+83qax8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oCyBwxdrNiV6UoQJET6JMi4dI2IGHuvbkf6Z1H3w7j7uz4OMB
	zYbZOkFE3hMnUzK6DACsM79NuIwESZDrilDuy50udX9hl9cJzk0mKb9SEjLnGtcH
X-Gm-Gg: AZFdTZdfm8k4XC3QBmU8pEIGkuwV3HEsJrghPGaSapKXy/0AQegTVVtOt/anS8VqzVa
	q0BUPToa8siQ9LzDSEVpkF9REHVe95RLilShk0pwU6oZkd9tWAf7ESikZfZOz7vSGk8eI129TT0
	Awe+miz2ofaqQ++seQBGpPPC1vmdl7GoMhPBJpZo0TMo/utBhMz5TfwyDSBV1YLtU9ipnMQV5cA
	GsKDacBuCutgHcYkwb9nV02XASum0DaHUbjpUMhjqcVuoH7K3195ue6xouJuU2qmnK8DIM51wIn
	cVhbC8zC9dWkWhU43FNJJmPqN3MeLQ55cEoSKB3e4qf+Zh4tDaPhownZ6m5CykE2n6pgr/DnoIJ
	WNO1wLdYP7Daxva0J1Fl5ZDQdrn7RksTtIA3GoxQyvOPJCo2WltjIUpZ1PS66WBxGYupJKP0MF3
	5cGRqRF81JpqyKuuGIbrjNo8MRJKX8SPm36XEH/4M9pefsgCWdULrywz+ba8aX0LvsiRIhjFFkW
	eJYo2Lstd03FdsOPPfeRHytYkXUXzglXCW9JciehKW9B6E4J9Qq848kvrTWcaS4QK3i5S4IP2Ju
	F1aKBmD6WI1zRZjHBdSV
X-Received: by 2002:a17:903:19cb:b0:2e9:3dd0:c8d with SMTP id d9443c01a7336-2f03f1cf44emr208593395ad.14.1795635047369;
        Wed, 25 Nov 2026 11:30:47 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84425sm93698535ad.6.2026.11.25.11.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:30:46 -0800 (PST)
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
Subject: [PATCH] docs: Fix the name of the memory hotplug online type configs
Date: Wed, 25 Nov 2026 19:30:39 +0000
Message-ID: <20261125193039.2437025-1-takano32@gmail.com>
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

The default online type is a Kconfig choice, so the symbols it defines
are CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE, _ONLINE_AUTO,
_ONLINE_KERNEL and _ONLINE_MOVABLE.  There is no
CONFIG_MHP_DEFAULT_ONLINE_TYPE symbol, but five files name one:

  Documentation/admin-guide/kernel-parameters.txt
  Documentation/admin-guide/mm/memory-hotplug.rst
  Documentation/driver-api/cxl/linux/early-boot.rst
  Documentation/driver-api/cxl/linux/memory-hotplug.rst
  Documentation/driver-api/cxl/linux/overview.rst

Spell the family with a trailing _* so that a reader looking the symbol
up in a .config finds one that exists.

early-boot.rst also gives the zone choices as _NORMAL and _MOVABLE.
The symbols are _ONLINE_KERNEL and _ONLINE_MOVABLE, so write those.

Verification: a build of the tree defines
CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE and no bare
CONFIG_MHP_DEFAULT_ONLINE_TYPE in include/generated/autoconf.h, and
grep finds no reference to the bare symbol under Documentation/ after
the change.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt       | 2 +-
 Documentation/admin-guide/mm/memory-hotplug.rst       | 2 +-
 Documentation/driver-api/cxl/linux/early-boot.rst     | 4 ++--
 Documentation/driver-api/cxl/linux/memory-hotplug.rst | 2 +-
 Documentation/driver-api/cxl/linux/overview.rst       | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

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
index 414481f33819..be9d5e510f99 100644
--- a/Documentation/driver-api/cxl/linux/early-boot.rst
+++ b/Documentation/driver-api/cxl/linux/early-boot.rst
@@ -34,7 +34,7 @@ which dictate how memory will be managed by Linux during early boot.
   * Linux Build config option that dictates whether the kernel supports
     Specific Purpose memory.
 
-* CONFIG_MHP_DEFAULT_ONLINE_TYPE
+* CONFIG_MHP_DEFAULT_ONLINE_TYPE_*
 
   * Linux Build config that dictates whether and how Specific Purpose memory
     converted to a dax device should be managed (left as DAX or onlined as
@@ -61,7 +61,7 @@ SystemRAM.  This will expose the memory to the kernel page allocator in
 If `Specific Purpose` is set and supported, :code:`CONFIG_MHP_DEFAULT_ONLINE_TYPE_*`
 dictates whether the memory is onlined by default (:code:`_OFFLINE` or
 :code:`_ONLINE_*`), and if online which zone to online this memory to by default
-(:code:`_NORMAL` or :code:`_MOVABLE`).
+(:code:`_ONLINE_KERNEL` or :code:`_ONLINE_MOVABLE`).
 
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

