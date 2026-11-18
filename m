Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037330;
	b=iF4RA7S/1U88W2DLYA0LPcitdrKiavbPps1wzN3C8Z9j/Qi24oBGcFftSFC6qsnumfEN
	 55BCT3mtClAU5wdb+PJQX9H8vdo5sd0A6iVSLv96dTXZcztp6vBf/FOTTt/3HzUJTXYuj
	 PI01tl7cgGITEvhU0y9UmF76wFIB9wMfm+78NOnK5Cjs5a/gHEMzYkexXlgSQK0aEHqut
	 il2Q7tWhI6I4bDKesaOOktcNWp6WqwItU2FUyAVk6uHZrWhwDoX3oa/adE/sTfQ4PeP9w
	 U+At9ARtOggPWGSiEF422HrM/G+XrHRrHio5ZZI9PpQIclePAXvWih/LDevF9JzM6/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RinnfRqFmJMbnCr6d3DXp7w2qk/BhwlH7a68zOSwViI=;
	b=lCmF7gBXCltk1rgThrZivhqdRHRy1sWudaaINOvF4A0l+0h2b3dvLSCGCt3U7zdzVBJo
	 3FUsr90xnGUZYLpxIcxkHFWsQkcAtQkqi9lkh8oHLo1oNNanfK8O0y18cJ/NRgubsnlh2
	 VfGNvDwU6SsLSylA050/enlkOhQOOXe/WFlrgQLDH9q1UO8UzoQuHD4vmPEI6SxtySAxc
	 ikCTMOqvj3iRQmU976zgNNShTi7Sue8BTCA4muJ5pobJCavold+tGpjFIdLL1pX6S6RFH
	 ekfy3kK+V4iajZli94B+77Jvdk9CV2TTSKyaPnWrk7/7odc/kddU8662JfsI6EnIGCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=OamzoJbL;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80FD606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C80FD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=OamzoJbL
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2bf046d7fso859149137.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795037329; x=1795642129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RinnfRqFmJMbnCr6d3DXp7w2qk/BhwlH7a68zOSwViI=;
        b=OamzoJbL9uxjeznOyamyEJPum8bSRzXRjYlCzZLURlPdu+bET+SL96zAc0amHZw74w
         Ls8sLCgyWz7UeAOt1aeaNSEVB0WSGIqARJ/AqvqrElfpbhrNqY4nz8bhZPlCJnZsoBVG
         4meE12uFE8V563KmzfQJBho02GI9ZHqRHEoHFExj6VTqyOUdtltEI/921TA8KDu9uqeS
         RJRJHdgouAAehrM44ztE6RQDdN9QBi+E2EXFc5W02W63aimScMoeX4xHguu5g8VFWAU9
         dbSVTj2/q/wTNQdXzxNuotbpd6GoS1hLZq9YasC1nIJOGCWHD2d1rpLsR5Mppr3xfuJD
         VrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037329; x=1795642129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RinnfRqFmJMbnCr6d3DXp7w2qk/BhwlH7a68zOSwViI=;
        b=0VVA5CUMtXRpOJYtPqfsID3t1yURPWEiXAJQZOOBhT0Uz9y/87wZYpxj/X/CwiPJ8x
         chBn7CyfMdeu/HksD6JNxevnjZ+PqKX5SMLZmhmvaJx2A5Fq+8W2fdOu/bPWs/NgHb+h
         zSa9XAODot4FDXDWwdi4zSSHF7gxbowfinUCoJt4Fd/SevSrUTASmDnUCgRF1aISB0w8
         lQBGmYn8Y+roBns6HZHC8XLPNdAkewsdOwB7GmoNbrsZM6/Ve4mPeOMwtvkp0aNjENjW
         ayvZnNBVc4Ry9YQqm2V/aMNgnr8ETFSP387AvFzd1l/g8EIvxjptYDZiEoNKwWOxn5uX
         ilkQ==
X-Forwarded-Encrypted: i=1; AL+hErETTKybRqBKTK3PEZeMlJAZk1AqCPA6qNP3OAxpaKYQbF+TvjgTrmFOvCn/01/V4evY2HOup2RKSId5smE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1+R1+rQUQ3dclcZJk15YMHkmxmgto/ONvjTHfJaYHpFdlUY2L
	rP3xBnxHRk00ws75WGP2AXlCsxLfRAur1Vir8pNjUdCno7Z2N+Uyoxk1BErbhbMcyrQ=
X-Gm-Gg: AYBFou0zbKKm0s9L3vB73H8ihy57xDOkHpf7nbdW+7MUpcCaaOST/K+9XjxwSxI3U1j
	geaamav7QhFGjrP68cDH+NEvU40WBBb3VYSM4BKpAG2OvLKsbvnrWo5F81Yw8f1/MIy+4K0Ibaw
	eGEjXepPAj8i4oeacl2Tq80Y6GSxEBtUfAYeZBmObOcWRWFAR706nQVMC2EhUK37fFEXSdecgFc
	ihP0jGgOclsoG6vrStXsfaTOQgiZl0kF7elXuB6V/TY+dDhpVROgHwTvapYhF3yFAPuHs0pjBwI
	PX+JxZL0aYuHQUzmnockCkhqKEHeXzU8pEq/ioKk0A1hJKN7h671ytWXzzk/+Ab1VCH1nPAYgCp
	FvfC/+OL7V7ALYe3NuX/6EWkIrnw5uVkbo3tfrJuuiRMQeUWsi1tgjDRhoYkB7pzILRdEGKie6A
	Ayp1fxH/osbiO0VLepqFZT6KnSiQIzf/oewPzR9xJG5qE5SpY8HZtUIblZSoTU/2B5vrdEUFko9
	OcMn8GRPtv14u7hLYVwWk6bdSD5ivEgzaxnfCqQviradJXW3X3iaLST8grVBBJ5p1e2JmzgtgiE
	zer6W4XGKTUm0RtoQmlUGxGgcvWiVvYHUUAa/Xi06k6uDOwy+higIJ6nskGULOw3/6idKbqo91W
	c9+w2D898xuyKKKaQyr5p/ZaOQvg+BJpLyqU1MW1jzHjw9x2OioRr
X-Received: by 2002:a05:6102:4455:b0:7cc:25bc:3b30 with SMTP id ada2fe7eead31-7d6ba438d36mr1283355137.21.1795037328579;
        Wed, 18 Nov 2026 13:28:48 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm2724635137.5.2026.11.18.13.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:28:48 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-api@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v6 0/7] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
Date: Wed, 18 Nov 2026 16:28:35 -0500
Message-ID: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
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

This series adds the LIVEUPDATE_SESSION_FREEZE ioctl on outgoing session
FDs. Once frozen, no additional files can be preserved in the session
and repeated freeze calls return -EBUSY.

Currently, LUO freezes sessions only during reboot(LINUX_REBOOT_CMD_KEXEC),
serially under global write locks. On hosts running multiple workloads
such as VMs, freezing sessions early under their per-session mutexes
lets workloads freeze in parallel as they pause ahead of kexec,
reducing blackout time.

By default, session lifetime remains tied to the session FD: closing
the FD before reboot unfreezes and unpreserves the session, while
keeping it open skips late auto-freeze at kexec.

Userspace can optionally set LIVEUPDATE_SESSION_FREEZE_COMMIT in flags
to serialize the frozen session and its FLBs into the outgoing KHO state
immediately and transfer ownership to LUO until reboot. Committed
sessions survive closing the session FD, allowing processes to hand off
preserved state and exit prior to kexec.

Overview:
- Patch 1 decouples luo_file_freeze()/unfreeze() from
  struct luo_file_set_ser.
- Patches 2-4 add lazy block linking in kho_block and incremental
  serialization for LUO sessions and outgoing FLBs, dropping the
  separate luo_flb_serialize() pass in liveupdate_reboot().
- Patch 5 adds LIVEUPDATE_SESSION_FREEZE and
  LIVEUPDATE_SESSION_FREEZE_COMMIT along with uAPI and core docs.
- Patches 6-7 add unit and multi-session kexec selftests.

This series is based on liveupdate/next commit 079c138d2b68 ("Merge
branch 'lu-pci-preservation' into next").

Changelog:
v6:
- Rebase onto latest liveupdate/next (079c138d2b68).
- Replace "publish" terminology with "serialize" across the series (Mike).
- Drop kho-ro concurrent-reader prep (ordering helpers and
  kho_block_set_it_append()), deferring them to the kho-ro series (Mike).
- Tighten commit messages, docs, and address remaining nits from Mike.
v5:
- Rebase onto latest liveupdate/next.
- Replace reserved field in struct liveupdate_session_freeze with flags
  and add LIVEUPDATE_SESSION_FREEZE_COMMIT.
- Add incremental KHO serialization support in kho_block, luo_session, and
  luo_flb so committed sessions and their FLB dependencies are serialized
  immediately on freeze, dropping the separate luo_flb_serialize() pass
  at reboot.
- Keep luo_session_freeze_one() / luo_session_unfreeze_one() in Patch 1.
- Update Documentation/userspace-api/liveupdate.rst and kernel-doc.
- Drop v4 Reviewed-by tag on the modified freeze and selftest patches,
  and expand selftests to cover both uncommitted and committed freezes.
v4:
- Split out a preparatory patch that drops struct luo_file_set_ser *
  from luo_file_freeze() / luo_file_unfreeze() and moves file_set_ser
  handling into session serialization helpers (Suggested by Mike
  Rapoport).
- Few more nits from Mike.
v3:
- Renamed session->frozen to session->user_frozen, - Pratyush
- Added Reviewed-by's
v2:
- Rebased onto liveupdate/next and split out early session freeze into a
  standalone series.
- Dropped struct luo_file_set_ser * from luo_file_freeze() /
  luo_file_unfreeze() (Suggested by Pratyush Yadav).
- Unfreeze the session's files if luo_ucmd_respond() fails in
  luo_session_freeze().
- Updated reboot-only wording in luo_file.c kernel-doc comments and
  added incoming session -EINVAL / invalid flag selftest checks.
Link: https://lore.kernel.org/all/20261105050053.3063001-1-pasha.tatashin@soleen.com/ # v5
Link: https://lore.kernel.org/all/20261015093816.2438942-1-pasha.tatashin@soleen.com/ # v1

Pasha Tatashin (7):
  liveupdate: Move file_set_ser handling to luo_session_serialize()
  kho: link outgoing blocks lazily in kho_block
  liveupdate: luo_session: support incremental session serialization
  liveupdate: luo_flb: serialize outgoing FLBs incrementally
  liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl to freeze sessions
    early
  selftests: liveupdate: Add unit tests for LIVEUPDATE_SESSION_FREEZE
  selftests: liveupdate: Test LIVEUPDATE_SESSION_FREEZE across kexec

 Documentation/userspace-api/liveupdate.rst    |  20 +++
 include/linux/liveupdate.h                    |   2 +-
 include/uapi/linux/liveupdate.h               |  38 +++++
 kernel/liveupdate/kho_block.c                 |  38 +++--
 kernel/liveupdate/luo_core.c                  |  10 +-
 kernel/liveupdate/luo_file.c                  |  76 +++++----
 kernel/liveupdate/luo_flb.c                   | 102 +++++++-----
 kernel/liveupdate/luo_internal.h              |  15 +-
 kernel/liveupdate/luo_session.c               | 151 +++++++++++++-----
 .../liveupdate/lib/include/libliveupdate.h    |   1 +
 .../selftests/liveupdate/lib/lu_utils.c       |  13 ++
 .../testing/selftests/liveupdate/liveupdate.c | 107 +++++++++++++
 .../selftests/liveupdate/luo_multi_session.c  |  36 ++++-
 13 files changed, 473 insertions(+), 136 deletions(-)


base-commit: 079c138d2b6870bb658b6e638077264aefc03833
-- 
2.56.1.708.g77570a6a1d-goog

