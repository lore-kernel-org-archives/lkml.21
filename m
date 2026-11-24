Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525723;
	b=ncxNF+qjogMFWEmqy0Bu3ND6LIvK9w04PYoY9NWUIflGxhEVrwtFX7fRsT1y7k49Tws1
	 xW1S1U+XogQ0JHfrxQU/h23PssvX/LhHIcYV5wXLXnUe3h3+1htkKIRW6Nt1trWFkcHm0
	 gzxbVt0aadP0hUrOiAmmNI53u4e6ItwiMBKMRP3c1GQHTD4R7VA0jeUKGXT+EcRcXv27r
	 oigvipmzYJOZrkZe5/CYbBkMujLgRY0Hj+8O6wtYNUGoKQF6rUnlAfzewakfuamuZ3zFs
	 Cu6lyE5XHRgBfAWLQA4ImrFP+48e6fVZH/qQZi/0jsKwIAUAI28hRn0Enw4rHGS71Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XbztJIKjfD6YyhkVTo/7hoojOtoaJPqi9RVN75qyzg4=;
	b=gsEkIoaVFPCrl/UAm7xhRGfF/qygqkr77zgryI3zRYDAFzpJjf5Ro3kP0dOYcpItlEvV
	 vA32BP4csb4K//Y4tbC9auZ/QPNuqacJz2Jc7+zuDC9cxaXrnqMjsOcwsDJ7HC7wUiqTZ
	 AsWAsAGBRTp1t2nTBPwUher4No4Bh4NLWARb8o0fQ7wDPNL33SdTpOhKAN3uty1GyEY3w
	 +cT7ThkqoHrH2t0b4H8xPAYSENsTUysH/KJ/qxfkNrnaYylTIdlkYCdB47b5g77Xo2Jyr
	 yk+xMrgPEzBZdNtZbdNPuqA2nIAnREGZOe+D0tr70LM2fCMh+cYoy4jE32NQL0BIf2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjjR24l8;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260F4606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 260F4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjjR24l8
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eae1276409so1616141e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795525722; x=1796130522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XbztJIKjfD6YyhkVTo/7hoojOtoaJPqi9RVN75qyzg4=;
        b=EjjR24l8tyjGxfcccZbqX7quytW7SFdJYQyO6rZONUcSUO9C4k+jCQjSusu6M9VipL
         G3hbrmZKHckR2eMy4VqKEs6M5xr6ATRVK8mY0bnAAapB97kmTZvZPJGRmKWbp6ytHXbV
         kb0SmVRaxtvh0IRiKCx2zk1nY+7KSaITTsANXIvkB/HkIt28ogg7MY4WwNzkhoiksR0w
         hYjoHxPAs1mBxOiwjzNPidp+JWyYC8nMzVV9GlyF4Lu7nSUBc25kRnk/gaDRQav1l1ZK
         epZdP5XBVFFBiJrkEgvRd39vLMGSfMPXBx8ibPijE/rMhUS0qhPCIePYcVgSr8MFl45x
         yB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525722; x=1796130522;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XbztJIKjfD6YyhkVTo/7hoojOtoaJPqi9RVN75qyzg4=;
        b=sUhff+qSM0BF12EguTsujeWtEnpcwe5Yce4MbzkXhOa92XTu7UFef9hI8VKyNvvAg+
         fmnJVb6/gT8tJNRrIud6R5ko1jM3FTHFJDXoJd6dk7dRL7u1oEqnorCEZym8mYXNnfdp
         ba/nQFVlOQUEXNq6QBXD3mM7TVbjM1Yv9Nt/UBuQxj1NYJkoySADzyig7K5vC9EG6qsu
         6L+/zyIJBa03oiG4CyJTpliwqYj6T+P24W4jWJiF0J75pAio0GmeKZKnLAktCEhRNy0z
         UpJZ1kGpnCA8Op3BJJsJ3dWN610Dtt2Z31PdvdfMOsIZqkgV3PjfzEg+nC+EECpJtAL4
         l5MA==
X-Forwarded-Encrypted: i=1; AL+hErG1XtU3bzh10moHRTKdbXwww5JhwIo4By3g44HU3bEZERUdrBHX+g2BZfhfDy8gEqH52LeZP/UWhh3I8FA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kyFN0VjJKnkduoWdbVKmDtpOqD62WGfWmWlJE5yUYN/Hwe673
	S7xdE8X5ueVPE8cftVUvXM1x72UFNvzZR6G5Bp+7X7EOP+VoKkJ6AzEK
X-Gm-Gg: AZFdTZf/3wTznogNh1PXDoVrQCJqwri6QnHIzWY4ZkIZjiQqaWnyv5embayD2lrw0lO
	3nLWquV0dXFPA7p1fTSr14S3Sds632pQOsMdeB9wGB4r6knAOJ6RvXrPMubWbfp6kG6gqatCxUH
	vx3XQMya4zCTyB4E5HiLD3E7MqmPzu+u/eSnv8usXYUIloAvjv6roo8kOEY00SdPoITSCaTMUni
	iokth9wPp3aECVAgBHCupm3kERwuNi5usvK67qQfYN0UxIwcNJETbxrWSYQ5a2A/vXYqB4OjbCE
	On1xI3UJK3wJAFnzHGahU57ZIjuG9K+7pFZbimpYyneA+Ke9ZbCm1udh8iP75yvXnjIX5RJ4Wfd
	1bFutOdZh07DiwwvKnQhanl+E6O8aCZdu0VWNaHOECc7vbeUc7OumH3M93lqTYM3EdBLdA+b8QE
	SNfnw7PdsGKFwhzn/KFNFH4NBXCHxkCC3G3li7nk+5puTcrPMTHbnt1V34KYjj2F3GIVQXBt2/M
	mLG+Y1cSoa81fDBLHI7WXwmKR4EWuPpyt2e3ShQp6qTeZajXNaRb/EBRMNKE2LtpvRi8i89RcKI
	rdr3cBXcppmhF2XXOXgG2Tc5l3b9Ka7RXW7bSZJBrs69MA==
X-Received: by 2002:a05:6122:208f:b0:5ec:c3ed:7d99 with SMTP id 71dfb90a1353d-5ee8aea67b8mr6786741e0c.6.1795525721797;
        Tue, 24 Nov 2026 05:08:41 -0800 (PST)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:4750:f903:b503:f985])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e033aafsm14849601241.7.2026.11.24.05.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:08:40 -0800 (PST)
Date: Tue, 24 Nov 2026 10:08:31 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>,
 Ian Rogers <irogers@google.com>
CC: linux-perf-users@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_perf_build=3A_Only_enable_c?=
 =?US-ASCII?Q?ontext_analysis_with_Clang_23_or_later?=
User-Agent: Thunderbird for Android
In-Reply-To: <46a896ba-cd45-4747-837d-50ea4b4dbed9@linaro.org>
References: <20261123-james-perf-late-parse-attr-v1-1-cfebcd81a962@linaro.org> <CAP-5=fXuQWTt1F6BvKSXqgSkEtBQPKvKg6gmAe-ngyr4VGyGig@mail.gmail.com> <EC27692D-9692-4976-B7EA-4C3A91173CE3@gmail.com> <awSu48pUIh942Zm4@google.com> <46a896ba-cd45-4747-837d-50ea4b4dbed9@linaro.org>
Message-ID: <0E9F372C-C100-41EC-B5B3-46FEDC813E01@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 24, 2026 8:24:37 AM GMT-03:00, James Clark <james=2Eclark@lina=
ro=2Eorg> wrote:

>Looks like __guarded_by() has also been around since at least clang 18, s=
o that wasn't the issue=2E The problem is that it's not supported on struct=
 _members_ specifically until clang 19=2E

>I sent another version that stubs it out for < 19 which works=2E The comm=
it summary changed to "perf build: Stub out __guarded_by() on older Clang v=
ersions"=2E

>The header diverges from the kernel one which isn't great, but I suppose =
that's better

Right, but you changed how check-headers=2Esh treats it to cope with the d=
ifference and I'll make sure that tools/perf/scripts/sync-headers=2Esh hand=
les this case as well, namely if check-headers=2Esh detects drift, sync-hea=
ders=2Esh will update the tools copy while keeping the tools specific parts=
=2E=20

acme@number:~/git/perf-tools-next$ make -C tools/perf help | grep headers
  check-headers         - check which header copies are out of sync with t=
he kernel
  sync-headers          - sync those header copies with the kernel, creati=
ng commits
acme@number:~/git/perf-tools-next$ tools/perf/scripts/sync-headers=2Esh --=
helpUsage: sync-headers=2Esh [OPTIONS]

Sync tools/ header copies with the kernel sources and create commits=2E

Options:
  -n, --dry-run       Show what would be done without making changes
  -N, --no-build      Skip the perf build verification step
  -C, --no-commit     Copy files but do not create git commits
  -f, --filter PAT    Only process headers matching PAT (substring match
                      against the kernel-side path)
  -F, --force         Sync also when both copies have content the other
                      lacks, after manual investigation; tools/ additions
                      dropped are recorded in the commit
  -o, --output DIR    Build output directory (default: /tmp/build/perf-too=
ls-1000)
  -v, --verbose       Show more details
  -h, --help          Show this help

Environment:
  SIGN_OFF_NAME       Override git user=2Ename for Signed-off-by
  SIGN_OFF_EMAIL      Override git user=2Eemail for Signed-off-by
  OUTPUT_DIR          Build output directory

Through make:
  SYNC_HEADERS_ARGS   Options to pass to this script, e=2Eg=2E:
                      make -C tools/perf sync-headers SYNC_HEADERS_ARGS=3D=
'-n'

The script:
  1=2E Runs 'make -C tools/perf check-headers' to find stale copies=2E
  2=2E For each stale header, identifies the kernel commits that changed i=
t,
     including the merges that brought content of their own=2E
  3=2E Copies the kernel header into the tools/ tree, skipping it when onl=
y
     the tools/ copy changed (it is ahead) or when it carries intentional
     edits, and stopping for manual investigation when both sides have
     content the other lacks=2E
  4=2E For beauty headers, runs the relevant beauty script(s) before and
     after, showing new/changed string table entries=2E
  5=2E Builds perf and the other consumers of the header to verify nothing
     breaks=2E
  6=2E Creates a git commit per header (or group) with the standard commit
     message format=2E

acme@number:~/git/perf-tools-next$

I=2Ee=2E the limitation in point number three, about intentional edits, ne=
eds to be lifted=2E

- Arnaldo

> than someone on clang 17 or 18 missing out on all of the lock analysis=
=2E

Right=2E=20

- Arnaldo 
