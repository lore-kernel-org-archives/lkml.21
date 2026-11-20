Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201252;
	b=MY9eh1r4LGeLHEdK4H8yv6xfbnh63Xk83kWjfsWfHN7yM7nBoaV1nMLjaR2HJTqLoGHE
	 ZfCcgMefEAQa8qZFu8uCMJpS/7n7+1jqngp9Q9A6B8Q+NNA/0EsC1RKbTcOYikE+bgtZB
	 b9d/9mUDF6XCRn8wN6QJDivJw9+aOotIY7j9RnIc09cwh0SZGWZse1hiNdBG2gtmhv89m
	 FPml4yGi5XbTCCq6mWOq13hecwWcEkAF+PWd6QmmZMXivdgk6legjVz1jb382y0sow43p
	 6RtXX2jKmnVv1yFbbKGDAEZeUp5IBHs6X+KboN5c0We4TrCatN/DJGeKw/bEmQcxaLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UNLjbm4DATGnAXYQNaz3Ekm01BREm2qtWAOyb3LUDX8=;
	b=jikWXX0Q5zp51ECkSiqomP0dzfpzmxSLtpfhwKg01XfC+ZlPL2VtQv6oQVxVGRTAxB5S
	 /QDcLA8k5sQAOBUrNQfaL7ZEOtS5rJ3chXrh3Fs1nqVN8K6+aRlVA3Ky6iruc/r2jzqr/
	 DpivnfCcBCzMOL9rQvd0vbzXAV+EHVrbBerPYQw4VQnPpc1lPNG4fD7uBR4LJGlvd3DXB
	 kISFbzw4zj7zuF10RsEqbAC8I7tTpj4+Lslk/un1EI2C+NG5Djm3EMqXuLXCMX1reuWcm
	 KZUJ/3LBNUFPHYf1sY8FAPi2Et/tmLFUhSzFqtjE7QSMqMgw3kfI6/2u0YjUm6F8q5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JAhqkxbm;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DBB60A380B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92DBB60A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JAhqkxbm
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so2452132eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795201240; x=1795806040; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNLjbm4DATGnAXYQNaz3Ekm01BREm2qtWAOyb3LUDX8=;
        b=JAhqkxbmIkOhtP5FM2VZ7m5v1kCutgrj5sLE0vGz+5DDXqt7FuvbPCT+mjrVhDGfPM
         e/7ZNz7pai8TXmXAtJ8363EO+GBUrsXoja4cZg3NCHuamS0rZVqKoSIhcx8w54ri9jz4
         AsimjJy1kYwuRzadrI+QnAzhcDljKdSRqTyMjNxFtUQZ09RZ3cwH5f9BHnO2y3tMoVce
         zKppTqrx8viT6HVXhtGpM37P/FfRT5sr4+eqJvt3rOz+M5G6B5LApCFiBHAZs3Y5wCBH
         lwGN/EZgjrMW+zSUhx/D5BXRedhNKumTkWPKWekFO1WMaEEV2D8LHnmeJPOqT50h4ZZT
         bA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201240; x=1795806040;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNLjbm4DATGnAXYQNaz3Ekm01BREm2qtWAOyb3LUDX8=;
        b=c/Yqur905RLTn85abj3WJB6vreU7WJM77lIiMO6smn+RvZhy/ioVe2TCsvXNgr8Als
         rwRNCuScpTUrpLT1FL3dx/9JHJ/HWAysg00hU1BVcWr5vxn4RjbiQ5mnh/HMb6qTxBaN
         TibIdw3i1AI/GAnYsvlkRHvArLVpZcEuoLOa4bi3lEDtciBAIexg3BDLUOuPIePg1/ea
         V16VPvpJiHVGmCIll/7HPjH7PMXJcnvTQt9ap+LTO6s5PcLp07v4hfbOa1B8/xziDVy1
         MuBXKzm9ZE0Gg73r7yBl/Q20FDLqS2U4wwesNdKU74q9vSbjMdGwOVooK2o94huOumc/
         Tk6g==
X-Forwarded-Encrypted: i=1; AL+hErExT2E41GYTMLXexcMRyeVmEqa1nm/ZuaX0/EACI8m5hAKmOQZtUQq9wOQzfrB6+V9xrpfnaCWWpY/IcrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hIbbcVtXMJDyoZXaFHNpF+QUuqj3zuo0QJv6D+SOhMH262sdQ
	P+jWpZMxyD/icJFz5TyXCEEyX+608rmutIgCt/2rzs2RSUG91S0CixiQQSUdtDhllqXog8ac2G4
	njbNN9O/QJA==
X-Received: from dlbuu1.prod.google.com ([2002:a05:7022:7e81:b0:1b3:ba1e:2c7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4584:b0:1ac:9da7:e86e
 with SMTP id a92af1059eb24-1b556908c17mr3830341c88.30.1795201239052; Fri, 20
 Nov 2026 11:00:39 -0800 (PST)
Date: Fri, 20 Nov 2026 11:00:28 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120190031.1587531-1-irogers@google.com>
Subject: [PATCH v2 0/3] scsi: mpi3mr: Fix error return, start_time, and
 timeout check in mpi3mr_bring_ioc_ready()
From: Ian Rogers <irogers@google.com>
To: Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>, Kashyap Desai <kashyap.desai@broadcom.com>, 
	Sumit Saxena <sumit.saxena@broadcom.com>, Sreekanth Reddy <sreekanth.reddy@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: Laurence Oberman <loberman@redhat.com>, mpi3mr-linuxdrv.pdl@broadcom.com, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Split the mpi3mr_bring_ioc_ready() error-handling and retry fixes into
three independent patches with individual Fixes: tags as requested by
Laurence Oberman:

1. Return -1 instead of 0 on failure exits in mpi3mr_bring_ioc_ready()
   when retval is 0 (such as unrecoverable controller faults, hot-unplug
   during reset/diag-save waits, or ready-state faults and timeouts
   after mpi3mr_setup_admin_qpair() sets retval = 0).
2. Initialize start_time = jiffies on entry and guard the post-enable
   timestamp reset with a boolean flag so pre-enable failures and
   subsequent retries never read an uninitialized start_time.
3. Rewrite 'elapsed_time_sec < (mrioc->ready_timeout - 60)' as
   'elapsed_time_sec + 60 < mrioc->ready_timeout' to avoid 32-bit
   unsigned underflow if a controller reports ready_timeout < 60.

v2:
  - Split v1 into three patches, each with its own Fixes: tag (Laurence
    Oberman).
  - Move 'if (!retval) retval = -1;' to 'out_device_not_present:' in
    patch 1 so a single hunk covers both out_failed fallthroughs and
    early out_device_not_present jumps cleanly for stable backports.
  - Add Laurence's Reviewed-by tag on patches 1 and 2, and note the
    510s (570s - 60s) firmware timeout math from commit 9634bb07083c in
    patch 3.

v1: https://lore.kernel.org/r/20261119170900.1530138-1-irogers@google.com

Ian Rogers (3):
  scsi: mpi3mr: Return error on all failure exits in
    mpi3mr_bring_ioc_ready()
  scsi: mpi3mr: Initialize start_time on all paths in
    mpi3mr_bring_ioc_ready()
  scsi: mpi3mr: Avoid ready_timeout underflow in
    mpi3mr_bring_ioc_ready()

 drivers/scsi/mpi3mr/mpi3mr_fw.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog

