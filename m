Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463722;
	b=O3jONLk/3hBOCAnhgXkD0+GojJVNTrTTTPODG8JhUpFLUWJJXutgucNrZ1ZwGV7bb3jT
	 Y5nhWC/pCyjp0JXkmzsiES7TkwB0PtTK/wKSsf6AWwpOe6hlTnzwjGxGUB8OE3GUaUOyP
	 L5Ho40MjSUmm0I1c8ZDGDPINpmBEf+24pzmiE+Hc4UWD+xtPkIT+Hj+ZFPJbk8fNhlVhP
	 ImG/ITtM3QDCpT02iErjkMdPtnkpf+AHsTDFtJkA9LWDisNwBNOncwxVUpAS3mMvzYx5y
	 IRZCQ+lyY22pYQ8jgO6d1/17jCPHRZICaVXLZPATzbN7FDKIKECeG1wW9eHFtCr0apw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=y26CddRxslMKEDtGhRH1mgKHs/1RBt+iPeBTvAPGQt0=;
	b=3DHy9CC+4rh29xLZ0XHUF8gs3f6gfjFeqgxsXOdUiLNo6Lgh0f4UTrUgNkuOI4AYyyNX
	 noQZf0zITC+oUaHlxhspGTPhy5I8/ArRX4onTbnA1mmgCHEkjCTomj/sDVTLhguDYtDku
	 6GV35q/qQj1khoFe6wAspoZG1kZD21UDqdIP+AdQ9b+0xHD8BGuScxF2aHyLj5ZTSmv3E
	 sYWv+9R5K9AIlC2eTPCFUhXGmg0yoy22hEYS5bESAXEMZT0Up9LbMjjpHUODov2xbXgmf
	 xr5WBIkQEtDlvyPP227zt4vzyDB3CQp02cfClgUB+Er/DgkCx6+wQuAT18bxnlXqFUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uw0A3jxS;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA78606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA78606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uw0A3jxS
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2eba2b74aso2269443137.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795463721; x=1796068521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=y26CddRxslMKEDtGhRH1mgKHs/1RBt+iPeBTvAPGQt0=;
        b=uw0A3jxSPX8CqDEbKEq6aUEBJULIQtWBQXZCSkopbmKAvu/vQ+bPMrI3kNnTCY9m/L
         Ghxgq4xmntHOyfTFJqP8kfqLwERtLCILzmk3TQ7DLjkSt7VhonEoxJ0Ye6GYLz2i/xjv
         NmYUFCrsobmYNsJYeRsE3ts90VzgbTbXr+43WZRcrYmD4Kc17vad5kk8+jtI4rqu/OBE
         QpszEuZpSD8cENewdc/B3apM5ElUMYyp8M/ugZkbfo0pLQYq8d8clqp0ia/8cCgkv3bE
         neejocF8E2EvBBEgPw5JlrzhDjFw5ymz31OMQ+rcgqGH4nk/4EGn4v7S+lfXad9Jk8J8
         p9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463721; x=1796068521;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y26CddRxslMKEDtGhRH1mgKHs/1RBt+iPeBTvAPGQt0=;
        b=BD/azRsjcOcJrLrKPFe6Brtgnp7DGZzxZCT+gyO3qGLxLKTQPpSa3B24yEBlX+uwnL
         dvZhr07vO1/ACs7x8LBMjvjvfhAAuJVOPa42WWTaMPxoV6i1YmEUwpsgc9wohHNHW71c
         AUSVQjpJk92Nbx0Xs9qMu8BVL3dgQX9jFStlbV+STUvzA2v3wsT7bRb5dvDm4phfPLFg
         i3+PDBycngn0SLKLxKKVqjwc7MHJvr2PRCcYJOmzFJ99fZiu/bpM2gW0RutGLkR6XtKq
         WXh/zXzuXlwW0hukWT2y/J39Tvntab8CmiMLo65yDcYPzd7yA/VDnqWD/CQ1YBq+Ledb
         40bA==
X-Forwarded-Encrypted: i=1; AL+hErH1hArSsq+IZvL8gPAJ/ESLBXTSxNWAuRtwjokOkJLuZuDiekwkOx9IGH3Z2adgyqllTtX/NjPP9o+Dy7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z80cWFXoakYYy8owNHyqR/n7S2oWB+TzIAktE4BG8uh/NOfQEar
	pLjSGoD3zP6mqK7mGlHfhX1SfjH8mQAjLnh6k/dj5iW/rGy/3P2YIHvR
X-Gm-Gg: AZFdTZe7h4zPTpIPp36SlUKdkUDt2du1xrsCx+XuQNHXmyCu467dkjXNz3oH7Rn86b6
	RSXhuAmNV3ERJLlqtG3TKL+gcjEkBKurBMysTdB6B5QYUO/bn7l43dZTxfPNim7orlkPlO4Opyu
	VrvrL3HCBqgnQfIXWopuX18aWg7h3lvZ4tFNd57suy6cMkCsBVtqIAyQ+d90xkt7tEw+yCMr3dA
	AroUOToioQwAXwECmQUbpOXUeJw6IYV3tW+Yyo6iAcc3iqjcCgX7QbTe2yP3jZfT8be9IBN7XZM
	TIIRoSnt/F7t9cTnF2xvye84lBWnQLLPbXWwIJnG/79eaFhiwJEzDI4l4w+nBi2q2PcfM5mVFv7
	3nDha0pur+U4q6DjSzj8cBWlWne9g840mykkeCjNzKv33SULjpwLfLFAfhF/dXsSwrN4M9ZdB4A
	aBpM9GDtRA+OyEWMKTLhUE/DXa+L8QqOhZ06AsaBBndApr/fMD6lhLdPv3pWuLGcIKgp52CDLdn
	ZOBzcZy6Sgw8Jx5TxXRi8/AHZWiKWibjIUt7D35793i8y84dpI4BwWm7IOw2HmoY4tFAym/ifnf
	Hn8E28istc5TogA8wRLa9mgoN9PdDroBjgbBYqRWk4dF3g==
X-Received: by 2002:a05:6102:441e:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7d7393925f5mr6518303137.13.1795463721268;
        Mon, 23 Nov 2026 11:55:21 -0800 (PST)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:4262:70f1:57bf:e3a2])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e8265e55sm13034702137.11.2026.11.23.11.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:55:20 -0800 (PST)
Date: Mon, 23 Nov 2026 16:55:16 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>,
 James Clark <james.clark@linaro.org>
CC: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_perf_build=3A_Only_enable_c?=
 =?US-ASCII?Q?ontext_analysis_with_Clang_23_or_later?=
User-Agent: Thunderbird for Android
In-Reply-To: <CAP-5=fXuQWTt1F6BvKSXqgSkEtBQPKvKg6gmAe-ngyr4VGyGig@mail.gmail.com>
References: <20261123-james-perf-late-parse-attr-v1-1-cfebcd81a962@linaro.org> <CAP-5=fXuQWTt1F6BvKSXqgSkEtBQPKvKg6gmAe-ngyr4VGyGig@mail.gmail.com>
Message-ID: <EC27692D-9692-4976-B7EA-4C3A91173CE3@gmail.com>
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



On November 23, 2026 3:44:12 PM GMT-03:00, Ian Rogers <irogers@google=2Eco=
m> wrote:
>On Mon, Nov 23, 2026 at 8:46=E2=80=AFAM James Clark <james=2Eclark@linaro=
=2Eorg> wrote:
>>
>> Context analysis requires Clang 23 or later (see
>> Documentation/dev-tools/context-analysis=2Erst), otherwise the build fa=
ils
>> on older versions, e=2Eg=2E Clang 18:
>>
>>   util/env=2Eh:142:39: error: use of undeclared identifier 'lock'
>>     142 |    struct rb_root          infos __guarded_by(&lock);
>>
>> Only enable it when the Clang version is supported=2E Leave the other
>> thread safety options enabled if they exist because they don't cause
>> build failures at the moment, and might provide benefits even without
>> -DWARN_CONTEXT_ANALYSIS=2E
>
>So we've had -Wthread-safety for a long time in the perf tree, I'm
>guessing __guarded_by is missing on older clang versions=2E Can we just
>stub out the __guarded_by for these old clang versions and keep the
>lock checking?

Looks way more reasonable, and no need for a feature test since we know th=
e compiler version when __guarded_by was introduced, right?=20

Regards,

- Arnaldo
>
>Thanks,
>Ian
>
>> Fixes: 321967859933 ("perf build: Enable context analysis and Clang thr=
ead-safety flags")
>> Signed-off-by: James Clark <james=2Eclark@linaro=2Eorg>
>> ---
>> Assisted by Claude Opus 5=2E5
>> ---
>>  tools/perf/Makefile=2Econfig | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/perf/Makefile=2Econfig b/tools/perf/Makefile=2Econfi=
g
>> index aed2e952c8f3=2E=2Ef5adceee5589 100644
>> --- a/tools/perf/Makefile=2Econfig
>> +++ b/tools/perf/Makefile=2Econfig
>> @@ -65,11 +65,15 @@ ifeq ($(CC_NO_CLANG), 0)
>>      CXX :=3D $(CXX) $(CLANG_FLAGS) -fintegrated-as
>>    endif
>>
>> -  # Enable context analysis (linux/compiler-context-analysis=2Eh gates=
 its Clang
>> -  # attributes behind WARN_CONTEXT_ANALYSIS) and Clang thread-safety c=
hecks=2E
>> -  CFLAGS +=3D -DWARN_CONTEXT_ANALYSIS -Wthread-safety
>> +  CFLAGS +=3D -Wthread-safety
>>    CFLAGS +=3D $(call cc-option,-Wthread-safety-pointer -Wthread-safety=
-beta)
>> -  CFLAGS +=3D $(call cc-option,-fexperimental-late-parse-attributes)
>> +
>> +  # Enable context analysis (linux/compiler-context-analysis=2Eh gates=
 its Clang
>> +  # attributes behind WARN_CONTEXT_ANALYSIS)=2E Requires Clang 23 or l=
ater=2E
>> +  CLANG_MAJOR :=3D $(shell echo __clang_major__ | $(CC) -E -P -x c - 2=
>/dev/null)
>> +  ifeq ($(shell test "$(CLANG_MAJOR)" -ge 23 2>/dev/null && echo y),y)
>> +    CFLAGS +=3D -DWARN_CONTEXT_ANALYSIS -fexperimental-late-parse-attr=
ibutes
>> +  endif
>>  endif
>>
>>  include $(srctree)/tools/scripts/Makefile=2Earch
>>
>> ---
>> base-commit: eb79d2fbc230d41b009e49f20671303c6efbd946
>> change-id: 20261123-james-perf-late-parse-attr-4e996381859f
>>
>> Best regards,
>> --
>> James Clark <james=2Eclark@linaro=2Eorg>
>>
>

- Arnaldo 
