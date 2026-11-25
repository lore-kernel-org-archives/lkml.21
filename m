Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579223;
	b=WE/AbqGeYDqhELAyU49rIzc27pDH5n2eAYfg6nKvHAgiU6irid+Yr8txZ5TmJ7e5z1/s
	 hEvaT8RZUYiYVEcbMuGWv5N0ezMei54W3qFGlgFEv+jOP8N5lnQ12MlsFACmwqc7aoxI7
	 8WLMnnhkLTWQBJvPczScs7yyxXOAn+XTdq1eecLB5BPCIf489gTVhBKRqaViwNI4bPykc
	 mTRT4ig0J+zARkaSlPSS6H1xT1Sxch/G0NYf0Af7nvZKhHCvEVt6wrZLlbQrfQ0X745UT
	 vOmS5SgoWMRjQh+n5oQnRY3NeQ8UCBJUtlMrckZFeZdxPXu1GYuwickrK+XEEGH9IPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h9Hto31Ei8twsoteptDahJHqXFA5GSu7dTamilsJIHo=;
	b=r6qURQktuYPW9RULrOSO81WdZvGsNUuyGNB/BORkkRHST81W2iQjxJ8ZpP8uy1yR2jCl
	 SsaFKzGAdWb19pCY8u0my1fxcLwZNngT/8RBwNckucbjild7NTe2F0AqavTovTsJ1i7JM
	 7u0DMVn48GVODVkh9i4bAceOE7E4CEyee7/R9dSUh+NsJnTpeRkjcnX9O92+FISszm/32
	 FxJEoVWp8RmOMur6dvq+ZgF5kAuBXk5MnnS7NF54wqrirnbGRjoRBiqQIFDLyR/Snbmz1
	 KijQBJrXuK0LjOW4TYPQlK370WEG4+LhI+8DVvrExftcRQCqKdv3x0+nMpl6Hm8+Uug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QNHcF/N0";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0BB606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C0BB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QNHcF/N0
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b546061d58so11951693c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795579222; x=1796184022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9Hto31Ei8twsoteptDahJHqXFA5GSu7dTamilsJIHo=;
        b=QNHcF/N04NV8ILM8qkEX/s8SIJpCEw58cumyVq3qBS7wxFx5DkJ6YmQ7zpBgCcg8me
         /k7RWICtD5HPtKA9ac2COBlXd4P1hMiCaOeQeGDM3FWWQvG1hJqiGBPHFxQI6W5NtvHv
         hIY1yszW22yzTOhl8EFTHg5AFRQOAXdZSWxv+HwVVcqSMXCzQBD6//B0yfSlSdi47Y+E
         eZ8dkCE0aeRxdHTp/DloqtWL/6l1vf57xSBrxGaduQr6Pe490MljsvdT6h0VGTypqLHY
         90h2Uuzitw0FBu18rlvfmsjoUd9rpe7ub2XjlGCjsutosGJ6iCmgBavvn+7QEI6VJQZu
         1F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795579222; x=1796184022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9Hto31Ei8twsoteptDahJHqXFA5GSu7dTamilsJIHo=;
        b=FiE9aGO5gVVHPdJjSgZ7ebhErkr7tU6MlHUK1rgcxpHNn3rQACOuAaCGjPib9LDQfm
         kzBQbpes5ltsfbn/QABKILJLrz4ZZZEbikakAUGkj09nWPeM5rZehP8kI088zhpQliHK
         0paHZFnbC0C/W9WGcg8hEAJ3bGZXa1pkX+TfC6GYH8rI96WfJwoFc4WW7ZVMv/93EXDC
         r8+sE+952Yhra7vfksFGBuZgImWeILPkFuPHkcD72hf0zX70Dd31OrW3AWtekLbNGWyU
         pDxpH0fJVcliaZ7rQJPfpCpvJLd1buNHoSXNhJlstx4u3YnKBBd9xx3qqG6TvzqFapQX
         al5g==
X-Forwarded-Encrypted: i=1; AL+hErFAFrWVufB5iGXx0BfeJkLqJ1VYyDRFJtv83sAHfbaLPtOIn04Qfh2y2Axk37TWmsI3F/BIu9W075rLIK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fxq7+q+W3aH7xbzDYDlUFdX3Egz5voM+gp9ouSetoHi9UXMo9
	7tl/AQKK+Vgffnl2LrzD6U8qcLKT7XRj3TtFE9bStgkIv1ZDPLNfd6iU
X-Gm-Gg: AZFdTZcdMAbGWW0A6CYqrIyPnZ8PXffF4+OiV9q4l0NnDH39rDaWbm7ryudvDKeeRmK
	SiLl2SZ0V6eqykXz+CLyOq2dOiHi+zCIclplcktXX5B95zqx+MDgmVANYpkzLtLAQFqXP5m/4y4
	wsjM4u0iDnTLVi5KAxDPloHWucFGcVc8xBKiu/JTGm6lMotn181WICgiLAKqNEduSH22M81bviu
	A02mynbCiAgmKB3cf3M1yw/kHGkGSmYu+23Scfc7AgRyoO+l6nciIGIQ5RkTiwRP+EmLelxPHqm
	Y4NfUM0WCvmZisAhKga3hQlrx+zcpVGaoME8guTDgRvK6n9hoOmdXLPNOsdbU7a+1cbWVyoCBHV
	nxlUKMwsr8Xemhi/IA89nJTglMw8fPy9khrX0tWBLsShmYJfmWOwncSEUTNGeBodj/AqItQD3Qc
	Z/yEkM19hjMWj6acoodZr+zJZjvoXVmDIeZYzMBftpuNB2+iK9BIEYhyFpL9Ey4pc43uaIThOBE
	C1RsoGvAdS+wZ9KD+iTSw8Gbm4EqaV3mcwDyMjk20EibDbW+ey+YqKmxITxlVqHrsHMGJpQmSSv
	NqnjECN9n4edW7CZFgqwogC7Vxds7WAir+05NnAq9w==
X-Received: by 2002:a05:7022:f50b:b0:1b5:2de3:bcfb with SMTP id a92af1059eb24-1b5568ee8famr18413134c88.25.1795579221616;
        Tue, 24 Nov 2026 20:00:21 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm57094127c88.14.2026.11.24.20.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:00:21 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH v13 0/2] perf jevents: Reject unknown keys in the JSON tables
Date: Wed, 25 Nov 2026 04:00:14 +0000
Message-ID: <20261125040016.1675748-1-takano32@gmail.com>
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

Rebased onto perf-tools-next, as Namhyung asked.  This is v13.

The rebase drops the AMD hunks from 1/2: they are already in
perf-tools-next as commit edd09316bd37 ("perf vendor events amd: Fix a
misspelled JSON key").  So 1/2 now touches only the arm64 file, and its
message no longer claims to carry the AMD half.  1/2 now fixes the 16
AmpereOneX entries that spell PublicDescription as "PublicDescrition";
Ilkka has acked the patch, which is not yet in perf-tools-next.

2/2 cannot land on a tree that still carries those 16 keys: the new check
fails an arm64 build on them, so 1/2 comes first.

The diff of 2/2 is unchanged: two hunks in jevents.py (_valid_keys and the
check in JsonEvent.__init__) and jevents_bad_key.sh, which checks the
failing case only.  (metricgroups.json is a plain dictionary of group names
and is not checked.)  Its message now describes the test and carries
James's Reviewed-by from the v12 posting.

Measured on the rebased pair, on top of perf-tools-next (148690b95cc4):

  - make -C tools/perf -j2 NO_PYLINT=1 exits 0
  - jevents.py over arm64, x86, powerpc, s390 and riscv each exits 0
  - jevents_bad_key.sh exits 0: NotAKey in a table makes the generator
    exit 1, with "Exception processing <path>" on stdout and a traceback
    ending in "ValueError: Unknown keys: ['NotAKey']"
  - grep for PublicDescrition and BriefDescript6ion over
    tools/perf/pmu-events/arch/ finds nothing

Changes since v12:

  - rebased onto perf-tools-next (Namhyung)
  - 1/2 no longer carries the AMD hunks, which are in that tree already,
    and its message says so
  - 2/2's diff is unchanged: same as v12 (patch-id 8be9ac914f80), but its
    message now describes jevents_bad_key.sh and carries James's
    Reviewed-by
  - the measurements above were redone on the new base

v12 was posted at
https://lore.kernel.org/linux-perf-users/20261120134252.1036963-1-takano32@gmail.com/
The rebase request:
https://lore.kernel.org/linux-perf-users/awTB4cryDW4H4no7@google.com/

TAKANO Mitsuhiro (2):
  perf vendor events arm64 AmpereOneX: Fix misspelled PublicDescription
    keys
  perf jevents: Fail the build on a key the tables may not carry

 .../arch/arm64/ampere/ampereonex/mmu.json     | 32 ++++++------
 tools/perf/pmu-events/jevents.py              | 24 +++++++++
 tools/perf/tests/shell/jevents_bad_key.sh     | 52 +++++++++++++++++++
 3 files changed, 92 insertions(+), 16 deletions(-)
 create mode 100755 tools/perf/tests/shell/jevents_bad_key.sh


base-commit: 148690b95cc425950dbba79d73eb4f7938347fce
-- 
2.53.0

