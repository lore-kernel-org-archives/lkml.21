Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530280;
	b=E+OnHX8u1j7Iz3OovhoNuybzX0OjsNcQa5594OlFcJQfsoIVeTv43AbTVsa9MxlMG4og
	 vw6EcNbeGMNOphqPj6P1FzRSD6gsECIUTQ1kWFTe8EFa6IhU/LHoQjo5fsLwMFn7aw9ec
	 M4fOnZNsH/FwRuyyOlxkGLrjq3PcY8YKvYrRw9vVOeIG2ZNuHaQUgwLNn3p0WJwGtJ14B
	 G8Pt0J20mrOptAHvqhYdNuXyiTv5LaAscV13U4+5uspNUOs2Zrr5FXOAO3K2v42P9bDqB
	 2rdQkPKtGefbysm863TkT64LRKNBvIwfDgK5DZX9Y7nmcjIvkkHJGbMXDfEg+ZRZGmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zeYR8ZpHeq1pZR+dWFeLvQVug9RPwZ0JSTo3dxUe7oU=;
	b=v60pYfCDdHujKy/pXuMHiofy4NO+cEG7L5YaWsfXrdOQZRwi1OuyIMdb0qxWDGDVQ2te
	 Uq+VV7RQVLamIY13u7eghU+5uplZkNH/3+H42E3dVl2wF5Nerk1IZF0pqpK206Xh88kjX
	 wft99ahFbKqPneVcosngr9kO0OqspSxft+FMlAmLUxEiPVTPS1ICe7HC9dZCK531zbZrs
	 ky3KUkhQl8zgizKy44WDh2spGyDQk2ecWSBcTsz1jjQaMleUJQ6a006r25C9aElDDRss7
	 lHl4WyCB3qvgy/0wXv/2iYZTvVe6XPbzW3j1ZkQzTEkLJzezHy0X2l132GlKDDuvLIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=LmHp0DqC;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11F3606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D11F3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=LmHp0DqC
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b360828905so41337707b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795530279; x=1796135079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zeYR8ZpHeq1pZR+dWFeLvQVug9RPwZ0JSTo3dxUe7oU=;
        b=LmHp0DqC0LRcWzknI/MLiNMBE5IdV/Pjma5UHmY8zzorIPCtV77jLK8KiLMmtFYLBa
         89+/Z7XRSKgZNZi/nP/r/BuULrWI8qfvyRnxdRp5fo5qaRng8tk6qVQPcotdmlglWm3+
         SgfB610d4aAbAILLqBTOthGY7bd8E116LiOqP0ypMvHkcA4PSjyQwVzkfxgVwwQOlkmS
         IMJ31/cqmFDQd21IDMxpIVV0OQeZwvyvEBPu2gBWJE+1QJz/3t6HvR4n9x0+SF5ymL8j
         Q6pKroRBs45PhDK1IuSE17NFWuehw3+EfRM6C28jlCVOSQ43D5Ntiimv0yoYBSJYQGbw
         XyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530279; x=1796135079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zeYR8ZpHeq1pZR+dWFeLvQVug9RPwZ0JSTo3dxUe7oU=;
        b=OhuuK5kR61doDQs6axAD+3LV0CwdOzEe81psfyZKoo6ObGdAvx+vzakwhjdKZvWcZK
         Fem9B/P79yjGNg16kfjyyGhCYKcz/81CBdfxOx0af5pu88rCXzc6wNaKC1dJLLqGw2s0
         WK8yujKkNqTjYF0b0stpTmWam0HtnKwa3fhNJwstEwa3DLC+uWHOmFGJBGQNdIW6GKot
         uz2YjHDCQKgttopVNk/Le2muyaz7+B34XY+I3T8/tJTXzT9nHwUhmbSQrDzx+0m4sgMa
         kAa8shIZqL2Apm0T2VDcrBcUAtWg80IPj8ID2VJF44gKjO6WeKhJEP2Y3FskBH9qVBt8
         cpNw==
X-Forwarded-Encrypted: i=1; AL+hErGSKafxr9COu3h5rcy52amQ8OczNdfnNhYKBo/plD7TCXe2O8iSISrSfzXYnLykufLCSf6pmLCvmTkp8hs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ty4D6b+d1oH0D1IeV9wvoYxNJt8LIk4hB/M1CxJoxfDBiVff7
	Ukht+4DyDySAaL/7k7D4GoY5SPz71Cvniq+5vhAZI8DP+T8m/x8OAdeqiSa4nk5FR68=
X-Gm-Gg: AZFdTZfpEnblRFUeBHvidfovmRYLUHm8g+7baFDF3287dFk3hsD8/nLkMTsHeREM9dF
	idHMPvE68uLQEER5RA9qEwXdOZXslIK9PSSsLrNM8OsIbWQZ77/O2vRq5w+82WxikL1saV5IEgv
	ix7uT7DPjHV3jjK6AngzVhAHJnp0WDbfY6ntq7CV5yPlurDMNXG7hknU9jK56LygohRH7rjL3yg
	RgKtve6WCcXeiANqF/en7dGlnFYIDDrm78SeEvfgsgnd4LWrqlK9XQlHTUqvg4c1hBkHn82dVSf
	K6RqiqZshXBtUN4M3s7fabABGgK4ns5qcdIwaotAtVs9gQauIjnOVR3f+o/8PYeqvCG5PuZDTvm
	K0hN9nZKY9yVAoywPZsq/QQM4awmtUk+D45a1lKldgxS6L42+K6EZ+qJ9ucTcdRRZLeQEwWAs3V
	tUxvmxJdCuZjSmgF4/tJkuR0VWlnCsxsfI91QH70uAqJQRA3T8B2gtRQAn76pOVYi44pTV3I84H
	T7kyMjpyUSbqpsVSmp5SCwUURWESeNrhW0Gx+ErASyEUbth052beptS+4UbKqy00VHEGkNxGYax
	7I0LTyBueOjGIcvJQtmFuiNFhnsQx5osKV1J96Y=
X-Received: by 2002:a05:690c:e004:20b0:8b5:6583:a09f with SMTP id 00721157ae682-8b56583a41dmr3892037b3.100.1795530278752;
        Tue, 24 Nov 2026 06:24:38 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52033c2d4sm58062957b3.36.2026.11.24.06.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:24:38 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Shuah Khan <shuah@kernel.org>,
	Jaewon Yang <yong010301@gmail.com>,
	linux-integrity@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>
Subject: [PATCH v3 0/2] tpm: Do not allow io_uring for /dev/tpm0 and /dev/tpmrm0
Date: Tue, 24 Nov 2026 21:24:30 +0700
Message-ID: <20261124142432.368943-1-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
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

io_uring passes its own file offset to the TPM character devices despite
nonseekable_open(), and its asynchronous requests do not fit the single
command and response per open file. Patch 1 rejects io_uring and AIO with
-EIO. Patch 2 adds the selftest and replaces the separate selftest
patch [1].

The series applies on top of "tpm: Track the response read position
internally" [2].

preadv2() and pwritev2() with RWF_SYNC, RWF_DSYNC, RWF_APPEND or
RWF_NOAPPEND now succeed and ignore the flag, instead of failing with
-EOPNOTSUPP.

Tested with swtpm in QEMU: the tpm2 selftests pass, and the new one fails
without patch 1.

Changes in v3:
- squash the selftest into this series, SPDX GPL-2.0-only (Jarkko)
- keep tpm_common_read_iter() and tpm_common_write_iter() non-static:
  like tpm_common_read() and tpm_common_write(), they are used in
  tpm-dev.c and tpmrm-dev.c (Jarkko)

Changes in v2:
- open the message with the use case, rewrap (Jarkko)
- drop the CONFIG_IO_URING guards (Jarkko)
- drop Suggested-by

[1] https://lore.kernel.org/all/20261123165638.2161305-1-rmustafin@cloudlinux.com/
[2] https://lore.kernel.org/all/20261120121614.978396-2-rmustafin@cloudlinux.com/
v2: https://lore.kernel.org/all/20261123173321.2363162-1-rmustafin@cloudlinux.com/
v1: https://lore.kernel.org/all/20261120142116.1630010-1-rmustafin@cloudlinux.com/

Rustam Mustafin (2):
  tpm: Do not allow io_uring for /dev/tpm0 and /dev/tpmrm0
  selftests: tpm2: test that io_uring reads are rejected

 drivers/char/tpm/tpm-dev-common.c          | 70 +++++++++++++++++++++
 drivers/char/tpm/tpm-dev.c                 |  2 +
 drivers/char/tpm/tpm-dev.h                 |  2 +
 drivers/char/tpm/tpmrm-dev.c               |  2 +
 tools/testing/selftests/tpm2/Makefile      |  2 +-
 tools/testing/selftests/tpm2/test_uring.sh | 15 +++++
 tools/testing/selftests/tpm2/tpm2_tests.py | 72 ++++++++++++++++++++++
 7 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/tpm2/test_uring.sh

-- 
2.52.0

