Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182178;
	b=qprRnInmNpfGTwwGQEnj+5PXqZZuR+1ys3tSty7aY+ECDHCaM8Cbglr6F2MQp30iTxHc
	 dBt8/ZkVSydB+XTbzlDyBFSvUKK+PPfpV9HoBC4HWEy4pm/qYconl5URRX22/7RNZVIH+
	 xMQQ4QuBsrY3LGCUKpieGf8sBUfHtUGbx+24adpXx8cGpptDfluho06o9pRs3T3nsXjtX
	 89powy7DwP7DECBDXD++ShfEYSf4SZqfPrvb5cqKlBKZCzpf7cxtSh3kNmGAL4N8yKWdf
	 ZlsJBs8BVgb9zRRbyP+NsZ5TtEZQ90IoCoc776paCdW63E4QZOxz5ByeShRO80yKq8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y8Ts16+pEgKO3za6EY6j5FLRvh5fbwbzMTmSXwpDQqU=;
	b=ME6e0JCyYgc8V29KV6ln0cVTDCJYMKxP6hCreiyalZd2E3FOCPEMFwtbPv3wKkqjLvkg
	 43o7Otj0mcHEEBRtSXoh9MWjMF7Udoy5KXvKrKzb0Jdh9LPjX4ksokCPPMVnzoMOwUD69
	 wd0zxLibJPEJra+ebtEiyK5XA9IoIYi7pvZtimBJKfrDcvuJFOJclWxRMsQy4B0FCqDie
	 GaxIE1YSaazbxwsJjXgro3RLQx90XiBSm/SW81IJXjpjtiUcccdEZIb0G/ynjwaRi4SP1
	 FZvcWt6by3HYft7ggs0LjhLmSuyVGgZiNrPzFMhf6dgtsuPIpDtYLGrT89t5vsnpHsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XuxFIVtT;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112DB606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 112DB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XuxFIVtT
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a315ed211so967508eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182177; x=1795786977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8Ts16+pEgKO3za6EY6j5FLRvh5fbwbzMTmSXwpDQqU=;
        b=XuxFIVtTWzsZyWpiewZ01Z8a05VnZBztKpAKQwWQvIS5TtcKHvnFpw1C6t72RbgHQj
         qbJ8i6UsUYOc6ccJcT8p5zfVUIU62k3+/f6mUmK1vnDyX4iccXdgWeXj4dFzJm9G4Uqk
         2gDZA9IBYVFoWoCdE3S7aQQadJRVEgNrNKFMKHFXaVb8E/rX5oAfxCLq0BUbw+lkgeiN
         A1O4JjEOskVV9y2igd1bNjIoTThdfVEiouA5ssykR0JxG+27FeAF3FtvsBsgWNQv+ojy
         DdWZ9rTIhZfD5yQGHGEfo7mGWN6rvEMm89Sx6ZKCCDSRo/2THCGplRwh89NtoGY2NSaT
         qnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182177; x=1795786977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y8Ts16+pEgKO3za6EY6j5FLRvh5fbwbzMTmSXwpDQqU=;
        b=0wpyP6fjByxhmSRmLFTmDSJTBu5lJEhC5wYrD9kgKmysvgAjAEJISyTpwWB+ywiIUc
         jQWIzGF/I+P8tDzpt6F+5+qCgso8x0anHlvNf3nw1+udT3yQuE2pEwK14iX7rX2FRzvN
         /azynXhG6HZa6ZNH5yCMiAiWmIgDZnm2aBQE0wRHqA38gMpiEI2CRAVhS6m8SGk9hY7v
         zcVlmZ2ZWwNHXU3sNu8r5DHAXC8geNFVWZGNgEJtGv95GWQ3ovpJS/eI+37ccAQigxVh
         rH7NLWZ68ltOQkPB1+5eSWuJ/eK1xFhXRCDxJ91VthDymgeK7Qq8UqiCY85KfIeVuCS9
         mSBg==
X-Forwarded-Encrypted: i=1; AL+hErHwWbmwjbo9JnHMG7srf5YA84200O68MSVsyvCk/lsvyapQ2uHodpezdMWfiFGeGma2abYEhoTnfvTmAnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jXPTELTijjOR0aCcSMytHtuhCBzbZgwXAhBpe4lrs9G4JnZFZ
	M65xWuZp137p4oRoBkN97KTgwrtgq9770h5jykpMrDork4msDEzlzMHC
X-Gm-Gg: AYBFou13GXFLrnqDkzhSlV5DmfZ1mpRqO+KwT77loOns0RpVHu+K+kSdgHiug4YHAO2
	owyaIkI5wie6SreOT+peezmMHJaIHS9I/a5KryJ5JEXAEp3W6DTNkTnXedbnqyQMUV15zX/mFl/
	6/9qxluGHYMYnZBW5NxULmkQsuwsBbvchRTlO9hgCdA8eCX2x5vT/LTTX0EjDuXWc/gZRaQe7So
	GX1FYQCs/49TYbK1gQBk+M+UyDStLOIMT7VFTP6i5kxSru4zEFHYNKeLBIhu4wJeD4YdsAzzdNl
	pwfFUFCsiVHmfKMILwWWQEYcIZgQSixr/qffA2ggULyyJPLZ/Q9r2/ogTDmMqYmTVbNZHjbhfl4
	R3ZPWbp5/QX3kXlBgsPkK70CR6v4b0EHuotyD2+t0QtIJJdIyxRQSe0L3Fwf0gPiLk3h7nSNcVF
	QFo/0M7CPlT4RCPRNY2cYV/F/YaASN8SmtMo4OePsvC+JVc+nlfqb3GdeiZY4gX8X8DteUGNWy9
	tgZP8iEkYUnG9CuoK/QSK13szXQPct1mQditBO+/5IGMFACivNgewpnHL4Yy9YNWiySy4Ozblcn
	pJPwbpPAfOBBwM+fv0h+
X-Received: by 2002:a05:7300:51d4:b0:384:fef7:5876 with SMTP id 5a478bee46e88-384fef75c78mr3949500eec.24.1795182176981;
        Fri, 20 Nov 2026 05:42:56 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm9590857eec.28.2026.11.20.05.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:56 -0800 (PST)
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
Subject: [PATCH v12 0/2] perf jevents: Fail the build on a key the tables may not carry
Date: Fri, 20 Nov 2026 13:42:50 +0000
Message-ID: <20261120134252.1036963-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120060931.711483-1-takano32@gmail.com>
References: <20261120060931.711483-1-takano32@gmail.com>
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

v12.  James asked for the raise and nothing else, so the try/except
plumbing v11 carried is gone: the generator already names the file it was
reading and the exception names the keys it did not expect.

What is left is two hunks in jevents.py: _valid_keys, and the check in
JsonEvent.__init__ that every event and metric table goes through.
(metricgroups.json is a plain dictionary of group names and is not
checked.)  The test is jevents_bad_key.sh and checks the failing case only.

1/2 is the prerequisite James asked for: the mainline tree carries 19
objects with a key the tables may not carry, so 2/2 cannot land on an
unfixed tree.  It is the two fixes posted on their own, squashed, so the
series stands by itself.  The AMD half went into perf-tools-next on
11 November; the arm64 half is acked by Ilkka but not applied.  If your
tree has both, 2/2 is all that is left; if it has the AMD half only,
apply 1/2 with -3 (its AMD hunks are already there) and then 2/2.

Measured on 1/2 + 2/2: the generator run over all architectures, over x86
alone and over arm64 alone exits 0.  Putting EvendtName into one AMD table
makes the x86 run exit 1, with "Exception processing <path>" on stdout and
a traceback ending in "ValueError: Unknown keys: ['EvendtName']".

Changes since v11:

  - the try/except changes and the sys.exit() are dropped (James)
  - the message reads "Unknown keys: [...]"; the test comment says the keys
    a table may carry, not the keys the generator reads

TAKANO Mitsuhiro (2):
  perf vendor events: Fix misspelled keys in the event tables
  perf jevents: Fail the build on a key the tables may not carry

 .../arch/arm64/ampere/ampereonex/mmu.json     | 32 ++++++------
 .../pmu-events/arch/x86/amdzen4/cache.json    |  2 +-
 .../arch/x86/amdzen5/load-store.json          |  2 +-
 .../arch/x86/amdzen6/load-store.json          |  2 +-
 tools/perf/pmu-events/jevents.py              | 24 +++++++++
 tools/perf/tests/shell/jevents_bad_key.sh     | 52 +++++++++++++++++++
 6 files changed, 95 insertions(+), 19 deletions(-)
 create mode 100755 tools/perf/tests/shell/jevents_bad_key.sh


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

