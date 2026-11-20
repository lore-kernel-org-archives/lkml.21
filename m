Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184493;
	b=34VSfl4SxrU/hMSQNaBOw9Y2PMLUvL6g1vch/p/sppPQ+e+Jqt21RwcmRJGyl+DFM2mS
	 cvsQpMMlELIH2oqDAYBp24efJud1PEU/hZqD9yUJF89v9gq1w0aGEqjlF/ivvHalNA59l
	 5Vhx/X1E5ZudulskwDSDp2De6aAnAN89iH8iLPMnLvhkR2eqrHdYvGTjFeTTKdDbe2+d/
	 wRLVwtRWxpo5BWz8N37dgq8IGLLHp4qsL7dnfcCjpmQdmGaP5yFjq6qgERv1s8fox+sjn
	 rxixhf7F017nUijhVjYuwCxjJGfJETY14h+QdFTTMMlMUdwVPIZAdxLusguHTl+BCfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8kbIPnTNVoYxnzuCSc7WD/8P36oFIhxLoZp7Il+xHts=;
	b=Tg2ZBFdz36X/7gzkyx8xGgM9uBzo2YkrDBbYAWK70xYURt8EbmeSL/5gYAh+kulz28Zf
	 4U+Z5y/2vb3DdmppTo4j5PKd2+ncgee7ZmT9PjTlFoXVI5/9upM3BBkLDMJuKCdkRNGap
	 KSNzQAUzZVsYO0jkDPOr69rNtTY8WDLfzb8yk1cAvSMm4wHrqoTydFawSMKMYX7hVA0XG
	 rQKAk6c9K2kw4wy03MEmQ2F9ndCxowIxWgteyEArKFPtFlrSAZ1CXUoouvIfTQgNdF7AE
	 SY5WEorw67Z916eqlpINCaZ07XOwK4BYRJaW9uaMix8Rply/8GMgCAJQ+FripM4J66g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=YCXylLXu;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C2B606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C2B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=YCXylLXu
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f04bea9a93so4716295ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795184491; x=1795789291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8kbIPnTNVoYxnzuCSc7WD/8P36oFIhxLoZp7Il+xHts=;
        b=YCXylLXuGacjr7o0Nj79F2yQRaIici/FHZRxISZWCv/UwhQz2VuGPEp1KArPhA1hzC
         EtNjTpC9GEeLrjlReZnG+jF9Icg+UPOaqACbrkcaOZuXDGeCEhUWhKp1ohWL2ccBEHJ9
         XmWkwouL02hOYTa3Nc3O+8e7FD1AW/JRqthUP+LSlUoDcsJJXio9MT7lg1FnQ9pCuKpx
         dW57n7UoS7zUblmhogpl4Lb0FOOdUV9zfK4RbnsaxRiz53NlVsLaRyOyPymHNlHHWq0+
         rPyCtQJG+9ZEXuKX0pOcrxHCs2XVKHzJBoEE42DWQlZctaIM/7Pt8uBGW+Spp/TTvK4e
         +phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184491; x=1795789291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8kbIPnTNVoYxnzuCSc7WD/8P36oFIhxLoZp7Il+xHts=;
        b=NT1rrrzWjqBlOFwPNAPj+sPkMhe7Kr0FSCOFEaPxqQ0AXdL4SJjCqM4sucgoba2RWt
         I/Bwnti/h9gSp6V3BGYm+q10v7uvqrQiXeNvvcvdc4C4zvx5xZmKcKqyK4JnKNcN4xz6
         SDS/3G5DvtTumvnaKya8NP2Qnay1zghaaE0L8sZwMEV7d/Ek2X19Ne4f284xCtX7KoCr
         G5YfOw3P/Rf65g7sVoTSuPMIVXQNED6oCO++ux+04G2wVqBKiCYO3L7J3jYw+Mk9Omv6
         6QT9nOosfEPnyyH8O19GmHqBFnmbUz+zhml0Z/fGmQffqPRlzhcemSXHx9vxKwoAQeuw
         43VA==
X-Forwarded-Encrypted: i=1; AL+hErFU8FJ3vm6+TDV/iU5ZL4Kr0F0FsUgiK7OszndVC5XzfQjnHPwTUWNB8v94cayJ5C/V2eA9Vz7l6V03z9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hL2bLxrVCzXHdbSeOqBWAwsf4IwXDCnR+s3AY2MwZsmV1t/J2
	JZ/iIGpex3EjTL+kHwtl/L0YzLtuiQhWw1UTyd/O1Puv4nKhqw8f47K70lq2H67fu9c=
X-Gm-Gg: AZFdTZf1pThMnblFlNPgfDHAFjzaBjhSLprSx30WvTUIo4g/1SYIgOpvgEVSGwxbh7u
	gK9xNgyW6XBlG466+fgoJUrWYm53EaechvtciQyt+hkQyCce3u3wN1Y0olShI0mabz4mg/aHdkg
	mwn3AXyK2RbIk2jJhGMw96EuSzTRjWJ2PRJXTrsNbA87PekC90sQIeBb/xxtFTEMnKmZDnf9eWN
	K0u7hjs5bMrS6LJHHXkMdrdWR4ZTVOeyoKdRcz6qFOvSHwfx+aQqUt0gSnwEl8zWoJ+Y1RYDwhB
	6i/+IfCXl7U/eclrcBZaFOkiypEDlML/EudJnrmp65uJa2ZfZmm28vOdHYsEDC7A/Ogkz3xp4JF
	HQ1opnB/S5Mp/5dzEF8Y+MXczpQ039p13pFRxDViimzMaFXv+YNSpl+Hl6IYSfQhc6vVQAJubld
	Qs1vcWosjV3SnF9uBtq5pIoUPLn7gGsSa3fOoAWpNr531+fAhPsxLz4VlD/27c2CVh8iq5YFDsW
	DVqoAQYP6ZaA9x8TWCRXcxyoc21djKtTPsRwNrz8SVuchQaXdBm1NyR8UkimUEmZ9pmeXHsygoP
	8x+HDsLa5viJvhJoj7OZPboeCxhMiA2Dm6P6
X-Received: by 2002:a17:90b:442c:b0:3ac:aa8d:19de with SMTP id 98e67ed59e1d1-3b41c7d17d9mr3258685a91.3.1795184491524;
        Fri, 20 Nov 2026 06:21:31 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm4622229a91.6.2026.11.20.06.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:21:31 -0800 (PST)
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
Subject: [RFC PATCH 0/1] tpm: Do not allow io_uring for /dev/tpm0 and /dev/tpmrm0
Date: Fri, 20 Nov 2026 21:21:15 +0700
Message-ID: <20261120142116.1630010-1-rmustafin@cloudlinux.com>
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

Patch 1 blocks io_uring as suggested in the v1 review of the base
series. AIO is rejected the same way, and readv() and writev() keep
working.

The simpler alternative, read_iter/write_iter callbacks that just
return -EIO, would also break readv() and single-iovec writev(), which
work today as well, e.g. a readv() of the 10-byte response header and
the body into separate buffers.

This series requires "[PATCH v2 0/2] tpm: Track the response read
position internally":
https://lore.kernel.org/all/20261120121614.978396-1-rmustafin@cloudlinux.com/

On its own, patch 1 closes only the io_uring trace of the base series;
the read()/write() race trace stays. It also opens a new path: the new
->read_iter() lets vfs_iter_read() callers such as Coda reach
tpm_common_read() with their own offset. Today these calls fail,
because the TPM files have no ->read_iter(); without the base series
that offset would index data_buffer again.

Tested in a QEMU guest with swtpm and KASAN: the tpm2 selftests pass
with both series applied.
Claude Opus 5.5 was used in preparing this series.

Rustam Mustafin (1):
  tpm: Do not allow io_uring for /dev/tpm0 and /dev/tpmrm0

 drivers/char/tpm/tpm-dev-common.c        | 72 ++++++++++++++++++++++++
 drivers/char/tpm/tpm-dev.c               |  4 ++
 drivers/char/tpm/tpm-dev.h               |  4 ++
 drivers/char/tpm/tpmrm-dev.c             |  4 ++
 tools/testing/selftests/tpm2/tpm_uring.c | 14 ++---
 5 files changed, 91 insertions(+), 7 deletions(-)


base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
prerequisite-patch-id: 929c8a56f28a166a5961816bde23cb25204ac74a
prerequisite-patch-id: 624623d00390085ca69fae7309aee60aa27b163e
-- 
2.52.0

