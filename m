Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795717785;
	b=usLA2Rctqv9ZWgBwzK03bcBFwqThw1bNlsm/f4UUyH6c42tQNehJZH0q40BUO6PXEwjL
	 InppDhGt6FFe4PO1QPo53wOo5OC6Ca20g8ERcO7kGMtZI7QbrHscgSkOmcJhrACVFkXJp
	 2zagqvR6QCMJiA/gluFIM9fWBfn76Topl7iFkdeSfYzgWZ5XDLDevOiaiTSpXyrl6tGDe
	 WXqUR2JUbKf6vcTkkmyOR0h8wG6jOslQ2H+v4GWiuFJiFr9C6QVGbIMCItEp/8fdnm4dc
	 V7ZFZoJovL+s4AwaU4qYSxxQUugv+kV1NizQ8wl6tITMG/O5VmvtbOy5SmpCZTgTiTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jQrziGWAtB1RIEv+Kll114OCtYDogfBv1KaAhc31nK4=;
	b=BuSBSdtz0BWfyV/gW7HyCl1I91QTx2VsCiRJKnWQiiPp4H81u/+egVIQNspPlzTuvxa1
	 qNj9rhGK2wjvDu3yZ8NfgUI1nBJvJw8ETl109NSebI9Q58y57r7K5/aJxBaJzWq1QYTAD
	 VcfFMIIc+JmsO0Wb4NhO0euDn9HEyqaSIpxSP6kKX3iP/+IG2WQmZOZPv/cjnlMqyo7O9
	 MVJdDiZixG6Cpew1R97bfbiVmHCB8tcMIbEu2bVXg9rjN9rAPP0tLhZB60z6BTsTEWqN0
	 TEK/IeEQt0DYBfN0X8u2jUsyUD3ekrP43XOv2ab/l843cQgw3gutc0iOf/oNIV/FnwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJ4k8yGD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45178606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45178606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJ4k8yGD
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-677bc4704cbso8577811d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:29:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795717784; cv=none;
        d=google.com; s=arc-20260327;
        b=N5vKDyt5eC+6HU0cBpxUWEoSQYgwTuNjUT8hLaa3zdl3/rAumxqmzBvQTnPK3aV3jG
         YbN3pUIwijWwzWR9WIrgakUPCOrk/S9av/UiMTd3gEs/7k8zpvy8QoGkYbHl57BMaOCu
         yJR7bWGtqsZnliMSDZd3iSRv1BdQ/eduuEQ7oQYDBfswLWit1AGAqTEGdQaXpL07j5sg
         Akh4aU8wwsUOu2ibDjvceVIoSymqkTb1Y1NVkTGSbp/CgHXSsC6Lyntaa2JqYBxv0gYN
         Y0uZIju7gnJWkguK9d7sJRjNrgrD9AKcuOSmuURU86kfpsF6Lf0KeCd4nc3MJwx9u3Tn
         aakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jQrziGWAtB1RIEv+Kll114OCtYDogfBv1KaAhc31nK4=;
        fh=ihR/HanlL8HeYGVmv871iZERnm0MLfsujAzHcXoiGEE=;
        b=Op4aWVb8aphdMIaGZKrVRvMlAqIKVQPYup9RTUqBTAkm59Zyf5bfNxJtwa8Q+8NKnT
         Bnnvup/RaGp3Iu9UIEnzHmp0zi8cDeX60ReyUja4xuhSrGT+Ba46PLTF8mY61DzPDgSC
         Zq6CTtA+CnwFs4Ix0gf7vViYsB+IQjeDECvEk39lO0h2KSxlifOsMlX6ZWSuCjhsSsO8
         lcIE9vEWEpSrSmMACA9RM1ejZlwi1AbzpAItEmImVzMjwdXWHCKjKY6DeG9dOuTzLDID
         iVfhs4BDOusn245olSCYMAN0vyJMgKRcqgEddv9MNMAihSVNtGn6rsCIWiDF0zc/6ipr
         ZtlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717784; x=1796322584; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQrziGWAtB1RIEv+Kll114OCtYDogfBv1KaAhc31nK4=;
        b=MJ4k8yGDxGzVLtMMOUe/mfQbMrHzNuoGQG2qy4lERWypTHxAZz7bBXaUgDRdws89qL
         OvJjWJjs7yKZkDjLoc0J2MDSRVp2hmxl5/nyCXIAtJEg+NpWQvJv9IV7D2V9XL96+GYa
         kzUgFyqK33+zcNcePU8wE1ldNzg0le2XnLNkfT3JquXQBMZFED0AK4nHgpMHLBKbX2HA
         EB5QyKNfp846LM9nMXSKtNz6n2KunpWGVQRiVJ74ng+FyIYvm9ko024J8bonudJicvCP
         81A8MSJ3XQ25RhPgVK/AR76pgdmKprD6ouGk3JIYYCW8WaFB/XCOxxa6nJ668dJAmvDg
         JLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717784; x=1796322584;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jQrziGWAtB1RIEv+Kll114OCtYDogfBv1KaAhc31nK4=;
        b=j9ORO0v7VEHbhFe61nXG8RCaxNGR1+kyHfHq21jChYnauh9KOc4REIJtaLx1i44zlz
         zcaWYKofNViYvaNdff22Fj+5cJjeHCWRcKch0fS08RnacEsfkpuUM37KCD8NjghVvrO6
         q1pURORJfumUKwdHRtm/PoQZeQPAUPX334Dks7WE2kIsaK8gCUZ+VRRmi5aBo8EbV7w+
         k68xhJKzqip0QNd82jILH85ikha0nh9yDjpUnOpkxQjklS3bqwvwmwIY1pOVQLiSeUhG
         Zm0LrfrK3MdyBT809f5N/yXoMOdlunk3YXTphNoaWnmGdXFu37XIQ9dMIPQCZ9tlqrk6
         gTqw==
X-Forwarded-Encrypted: i=1; AL+hErEocD4ZdEkIMO1KlkFF0N9W2lHtkNtLCKVmXO5qtMnC5N+VV8rFTHgybz3oq47AN7vrqYE+jDnv7F9hH4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z81ykTV3BV1tz75GUeRW1VVTfyb9wE6qGPvbF7wbPupVojpnbBh
	4zEAEOWQgYWRj7TQqA8g7o4Y3PQJ+XmvuwYSk2X86k3LnpPJP7WAQKzvPg3ffDXbuIo9GvNWNKl
	lPS+8fWUl0Lwx0686hSVqdIXYBGyXTEI=
X-Gm-Gg: AZFdTZfOhxtp5DspoyYwxygRfiup/RK9vya5rK8/Lvx3uISSa/hCwYXw3BAm+FUotqT
	PuPmHuAZnQxN6Adxx1gMpgO3+LcNQvtrhJfF9pFTGY3+xEualGT6kdV+FKhXSBLeY0Ked46VVQO
	QXnqAMW4lWPUwynx26i2CpGoY4/Rp+Ey5PSNzujT36oTaXtjlA0Hl+z7VmsKK38C9noaQceyniP
	viYf8YF1D2OqawfUWByOH1SEnIop4Jp5043U1hckBBrNLEE3gcZv0CYJ7upTyxNjQjhGCREDBFt
	EgJlVYFdT4J6yOGB99zyeW843cEfGSuBx2p2yY/lpP/maFJkKBYOwNg9IhGL+rqSlvVfZZZaIpa
	KiKJhwuM2B9pQt2oaGOSQuc7sbiODjL0jcJd+01eNP/COIkaQ5K487xsptfE=
X-Received: by 2002:a05:690e:190a:b0:67c:1b55:8b28 with SMTP id
 956f58d0204a3-67df441503fmr8107822d50.56.1795717784170; Thu, 26 Nov 2026
 10:29:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAL57YxZDQFH4cuv+dRbWwN5rv9K-45XbaznSQTQd9xBZLP9Dew@mail.gmail.com>
In-Reply-To: <CAL57YxZDQFH4cuv+dRbWwN5rv9K-45XbaznSQTQd9xBZLP9Dew@mail.gmail.com>
From: Tabby <nyanpasu256@gmail.com>
Date: Thu, 26 Nov 2026 10:29:32 -0800
X-Gm-Features: Aa3M54pKAPB-9zE_8Hy8qWxuUulTRImDGR5BuveBaYBrSjzO9wztKHtrRSFHXAw
Message-ID: <CAL57YxZ5eVuKC6u0uRN96vx7Hr6Pa+2HgE2mLoj4H087ARoOEQ@mail.gmail.com>
Subject: Fwd: Inaccurate unwinding/symbol resolution in `perf report/script`?
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

While using perf for userspace time-based profiling
(speedscope/Firefox Profiler stack charts), I noticed an issue where
`perf record -g` traces have incorrectly reconstructed stack traces
when I run `perf script` and import the profiling trace into a
time-axis viewer.

For instance, when I run `perf record -e sched:sched_switch -e
cycles/freq=99/ -g htop`, I get extra and missing stack frames when
viewing the trace with `perf script` or `perf report`. Interestingly
the perf.data file *does* have enough information to reconstruct
proper call stacks, and `samply import` performs this but `perf
report/script` does not.

## Debugging

I initially suspected that perf failed to query all necessary debug
info. Running `DEBUGINFOD_VERBOSE=1 perf script` shows that perf is
querying debuginfod for every build ID found in `perf buildid-list`,
but still outputs inaccurate frames from `-g/--call-graph fp` stacks.
I do not know if perf can't find downloaded debug info, can't find
on-disk binaries, or has an algorithmic deficiency.

I took a look at the call stack captured by `sched:sched_switch`,
where htop blocks on user input within wgetch.

- `perf script` reports the blocking call stack as `_start >
__libc_start_main > call_init > unknown > CommandLine_run >
Platform_done > LibSensors_cleanup > ScreenManager_run > wgetch >
[unknown] > __poll > syscall_cancel > internal_syscall_cancel.` This
has both missing and incorrect stack frames; notably in the source
code, `CommandLine_run()` directly calls `ScreenManager_run()` without
the intermediate frames.

-  If I run `perf report` and view the call chain from `_start`, it
reports the extraneous stack frames as `Platform_done (inlined)` and
`LibSensors_cleanup (inlined)`. Expanding further, it reports that
`wgetch` calls an unbranched chain of `0x7ffb69c4ada2 > __poll >
syscall_cancel (inlined) > internal_syscall_cancel (inlined)`. Here it
fails to resolve wgetch's function calls (whereas gdb and `layout src`
reports that wgetch calls _nc_wgetch > check_mouse_activity >
_nc_timed_wait > poll`.

- If I run `samply import perf.data` on the same capture, and load the
trace in Firefox Profiler, I see `start > _libc_start_main_impl >
_libc_start_call_main > CommandLine_run > ScreenManager_run > wgetch >
nc_wgetch > check_mouse_activity > _GI___poll > syscall_cancel >
internal_syscall_cancel`. This shows that `samply import` and the
Firefox Profiler it spawns knows to omit the false frames between
CommandLine_run and ScreenManager_run, and properly resolves the
frames between wgetch and ...poll... This call stack is also
comparable to what gdb reports.

- - Unfortunately samply is not a full replacement as-is, because it
only includes the first `-e` (I've reported to Samply and not heard
back yet) and doesn't symbolize in-kernel stack frames.

Is there an explanation or possible solution for this issue?

Kernel: 7.3.5-arch1-1 (64-bit)

## Prior art

It does seem that perf unwinding is a subject in flux.
https://lore.kernel.org/linux-perf-users/CAP-5=fWkUW787c4dGx9rccucqD67dfRgwBB_SoCxFnfZXtXP-w@mail.gmail.com/T/#t
indicates that in-kernel DWARF unwinding is being proposed, but it
presumably will not be ready for some months.
