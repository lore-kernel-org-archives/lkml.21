Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795366875;
	b=FxPJsbcFaeY7LwerWy5jpTxt7lH56fVyoCTDyJfezGDPGDXvAECi14sP8zB6T1keHms8
	 xUM3WH+JBbgiAXmNbY+2Ce+ShbgR7QsrHjS+WNC3+qWcyggrK1REht3g2pllDHfFbI3sl
	 B25qeGgPsljiOi9lzJldjbg9nfTTPyvgyMf33c4JnWo3TLVEOuWmKE4HuKbhaMmqamX+J
	 hwgoSqiw3i97pK9trcC+fA4DbX/TSCX/No2q3y2uOG0Eq1uZgMBo0sY+MBa6gQ6u7v4+7
	 3nR10oXgVMRNv7hlKwPZJtBd+GEIYGpVkpaG+jKei7uq1LZr/R75II7ECXLpC6VIsCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DrzgiFmBm4hYbypPeeTGjMwfD3uI6h49BzMOnPTdENE=;
	b=0YCH7hJbPx3OggAEJszE5rdyjRy7oOcwPX2MGgQhBULjTWKrf1vDdEGS4JxPaY4tKg/+
	 DDg14mv263Tz1rDS1SXv3ZJU9WkunXvFRG0YTm6aqhcyl/hL2rFL2789u+rmuZuM8IE6r
	 8EW784xf+iuFMLzkP79vAbW02O1O+lDxHiDEo2CGu0naxPVYtzmVgibYhgeqKTe+p/97i
	 DhYADe1DMYZGAo7W7YPW2GtBb/+ZpWx8Ey9FDDeTmeStdbAjFEKkw/KReL2vLfy7+MoYl
	 7o0mE9zbvj/ERG1SmNg6x5pZLcaA7Ev8s8a1e0dYr6g7xMN1vWYvJkOSBjJRKG1pAcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a3HCuWTl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1795E606A681
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1795E606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a3HCuWTl
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55be673e029so197911cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:01:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795366874; cv=none;
        d=google.com; s=arc-20260327;
        b=KEXmM4PP5WvSFhD7ie9FZjUSASduL8+EKJ0i72snvF/xsLykSEZyq+liBu6i9+WxBC
         gHSVSofj5cK6yqJITZOSFhG2UC+krmFp5Yljd/ffZmT0qYXCTvBOuP2VSw//35eIv1tB
         gvKK24ICYVKj5rKVDmKxz3IIIXrJ5dETwfcldAk+QQeYWOXYkH2eVKgIOFpiecCt13IF
         ay08QcKCXYSJaz8KPZ1duJSbk0xP/nKPdO9bKMh8/pMkCbsLqTNtuabS78fcT5h/xvXm
         e4QFmmJiR7E8rwI5a5ZMDKruumpw6FdSmKoHWXdXpvZkElqLCyX8ZdCCfAP9yy5EbQF1
         nC5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DrzgiFmBm4hYbypPeeTGjMwfD3uI6h49BzMOnPTdENE=;
        fh=6eqCqh/h7OHLOquL0oXv5JQEFzThoa0NCt4RMuLon28=;
        b=PAdrt7PCggdqq1PR2RvANS9ZRgz4KB0ZQ9u2EMcRbiXu19yw2jvPPvqHSubTYdriiH
         HRubsxp45A041qpqZ9D8nvdyFqAoRNhPzytF2kZa6goLv0JEwRLxccQbMlRSyLvUAuTX
         c2evhoq9RDyytBHFaa05MRGN2IY0FqLl0ZPRKrEBweKGXfhICypFMYf/FQHNdXoFNy2V
         EzDglOSeGSa5kdBhE3I1uBqvU+kCe35yJ6JwG8ZO0tKbkjrrBlwAmKrvzvxNH+ca4eab
         Z7ciMqK3u3oxx1TjcIPPQRp0zMybo/mPolJDIsdiS59QwDS9pluHdF6M1F38u+48Jv0U
         z7vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795366874; x=1795971674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DrzgiFmBm4hYbypPeeTGjMwfD3uI6h49BzMOnPTdENE=;
        b=a3HCuWTlj1VBbi4XxQexwtbCwJ2kVwkydMmHosKYha/JK0KEVYCM+u30WmzqU7kle/
         lqYkAszPMiIAIRLzL7afmK3l+ROxvNS4LZf7kC/NHi17qoETdopNXCFmDq8KKnxoJcDK
         Me2BlxT9S8oWjWvqjb2vc+gLFE+gJSO0AL5MVxYgEnayqiPLWVLnxWTuw/ADAlekBtU3
         /qkAD0YECiL5771X9+efacFLuXrWRm/Gzi0z70uBGyr/DwHevsHS8wv4LBkq6w3IrnAH
         vw+hif20G3cK053ik9yYtkbNz2bdrJPo7EICh+0LWYpyQVRA3ilGumPC+bcsBCuDJU7/
         kN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795366874; x=1795971674;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrzgiFmBm4hYbypPeeTGjMwfD3uI6h49BzMOnPTdENE=;
        b=MWbfEMIoZVEem6TrN2cvI/JYpucgsifGC8DAKPcj8tBYL4ZsibOnvPFVg8u7C7yZnd
         v+K9YJYSq1TBBe8QhxHQUUj5N9tyHyeNcEbT0Nic4+n0Vr+Se63xjzsLij8B8k3mWV8M
         FU0HL+V5Eu36auuDeZUxJxWFmnMZt1uyv54qSY7svCegS2JGu6qf83GXGOKc1yEe1GXs
         W6vwuRI0esV1a1iX9jhamNAmyMhi07/dsILd5sfjLbz0mSL7sU309Sls6Y4c3UiGxyaz
         O5sjUozIH1u0DGrBCBlhVEjFc3ovSOi3UCdznVSHKl2adXpNpDJusKtbWASVNQBVShWg
         ZNWQ==
X-Forwarded-Encrypted: i=1; AL+hErFraBO/P23R9ZGD5eP3gnRoFt7mQL+YN6T2YGmHo25o47nVhhH5cBFuy6GEMvhWPctmf3VcUbCGGcZVMT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+537HFE1LKa9nmYGJqRX/+UETLG1GBLaHjDk233i6PSuGrm1Or
	wNY1H34jzRoVwSVRNRvUkWCHB1VLyr3wMtDbA7pm67CZ4gobBd2LibXAz1YN7fkW3GqTgVEnA2Q
	+M8/iCWmgx4S761zhczP2n6VcK+IUEgKZeVL+q9qQ
X-Gm-Gg: AZFdTZdT9SO/3jgi3iQxV+/sDS0w+2CjiTbDRDQsLFnivvBvfjfZGWQ5EJN4MMKw1u/
	ZombrHwEQiQzPmDRmEy/Vu17fuJMkuSbyCE0/ES1qcEckugiRckU47KOAqowdfH83dvagbuWCeo
	mIaBF1HqFBVmRPnqkKGTBY7PHfijkJZSPn/nHsRMVJtpr2DTLpMPDoYGr+03nWC7MoN5ox3EFK4
	t8AffbrVPObAr/ZBD0YAGJxrQfZhedOSQ4F1g6k/RtXnMY97Q9ebszxB8aNSYhzvDjcXGmwXokH
	o3mvcBBKUi5+35ruPJ7afkulmbTk7OwgxJ06sMQgdPki3ySej6CO4NKLUX+BTsG59aeJBOvW1ts
	jaoCz42won8Zm6jkd4IwHWzJGDj/hp8ut+8vC
X-Received: by 2002:ac8:5cd5:0:b0:55b:d494:187f with SMTP id
 d75a77b69052e-55d881708admr22080771cf.5.1795366873162; Sun, 22 Nov 2026
 09:01:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113055926.1159033-1-irogers@google.com> <20261113152622.1991001-1-irogers@google.com>
In-Reply-To: <20261113152622.1991001-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 22 Nov 2026 09:01:01 -0800
X-Gm-Features: Aa3M54r5y9zALy56FUMMZIGiaMMrZkldEYrkffk8BjbH0vBHaQ1b36eXP6PTRU4
Message-ID: <CAP-5=fUFYGsixZCAT9dWi0oHj546oLS4YN=R3Zc9-+7JPzXdsg@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] perf timechart: Add --live mode to the TUI and test
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org, 
	alice.mei.rogers@gmail.com
Cc: adrian.hunter@intel.com, atrajeev@linux.ibm.com, changbin.du@huawei.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, tanze@kylinos.cn, 
	thomas.falcon@intel.com, wutengda@huaweicloud.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 7:26=E2=80=AFAM Ian Rogers <irogers@google.com> wro=
te:
>
> Add a '--live' option to 'perf timechart' and 'ttimechart.py' that stream=
s
> live scheduler, power, or I/O (-I/--io-only) events from a 'perf record'
> subprocess over a pipe and displays them in the Textual TUI with a rollin=
g
> time window (--window, default 10s), pause/resume via the control pipe, a=
n
> optional workload after '--' that stops recording when it exits, and
> optional output recording (-o), along with headless shell tests in
> test_ttimechart_python.sh.
>
> Assisted-by: Antigravity:gemini-3.1-pro
>
> v8: Address Sashiko review feedback:
>     - Patch 1: Track switch-out timestamps explicitly on Task rather than
>       inferring switch counts from pruned STATE_RUNNING segments, and
>       accumulate Task.totals from the actual clipped duration returned by
>       SegmentList.add() while keeping Task.since monotonic.
>     - Patch 1: Keep each I/O syscall as its own unmerged segment and avoi=
d
>       same-timestamp clipping so Task.io_bytes and syscall counts never
>       drift across pruning.
>     - Patch 1: Extend open STATE_WAITING and STATE_BLOCKED task states in
>       checkpoint(), preserve non-sleeping states across prune(), and clam=
p
>       live_prune() to last_time - 1 so open or finished states at last_ti=
me
>       are not deleted when idle past --window.
>     - Patch 1: Refresh comm names from perf.session on syscall lookups an=
d
>       periodic live intervals (ignoring perf's unset ':tid' placeholders)=
 so
>       pre-exec names update after execve(), and ignore scheduler-only tas=
ks
>       in dump() and the UI when -I is set.
>     - Patch 1: Snapshot flush_round_target with a sequence counter before
>       draining perf record's pipe so concurrent or split-record flushes a=
re
>       not dropped, and synchronize LiveRecorder.backlog() with
>       close_data_fds() under fd_lock.
>     - Patch 2: Add synthetic regression tests for all cases.
>
> v7: Address Sashiko review feedback:
>     - Patch 1: Pass the comm/PID filter expression as a positional
>       argument to /bin/sh so the shell preserves the quotes around comm i=
n
>       --live -I mode instead of stripping them before execing perf record=
.
>     - Patch 1: Clear LiveRecorder.control_thread if starting it raises so
>       stop() does not call join() on an unstarted thread and skip FD/comm
>       cleanup, and ignore OSError if perf record exits concurrently durin=
g
>       stop().
>     - Patch 2: Test the /bin/sh --filter quoting and control_thread
>       startup failure cleanup in the synthetic live test, and add a live
>       -I workload recording subtest when syscall tracepoints are permitte=
d.
>     v6: https://lore.kernel.org/lkml/20261112233738.699031-1-irogers@goog=
le.com/
>
> v6: Rebase onto perf-tools-next and address Sashiko review feedback:
>     - Patch 1: Queue pause/resume gap timestamps in a deque so rapid
>       pause/resume cycles before buffered events arrive still close
>       pre-pause open task and CPU states at each gap.
>     - Patch 1: Increment nr_samples inside TimechartData.lock and check/u=
pdate
>       refreshed_samples in the same lock acquisition as checkpoint() in
>       live_refresh() so final buffered events aren't missed when paused.
>     - Patch 1: Keep cursor following in sync when zooming in/out, resetti=
ng
>       zoom with '0' after moving the cursor, or jumping to a waker ('w').
>     - Patch 1: Filter out all threads of ttimechart.py (via comm) and the
>       child perf record process (via $$) on syscall tracepoints in --live=
 -I
>       mode, and ignore filtered I/O events before counting nr_samples.
>     - Patch 1: Track record boundaries in LiveRecorder's pipe pump and em=
it a
>       synthetic PERF_RECORD_FINISHED_ROUND when perf record goes idle or
>       pauses so ordered_events does not hold back the latest round.
>     - Patch 1: Always drain perf record's stdout on stop so perf record c=
an
>       flush and terminate its workload cleanly without blocking on pipe w=
rites,
>       and kill its process group if wait times out.
>     - Patch 2: Gate the LiveRecorder task-clock subtest on system-wide
>       task-clock permissions so unprivileged runs under perf_event_parano=
id > 0
>       skip cleanly, and add synthetic tests for multiple pause gaps, roun=
d
>       tracking, and cursor following.
>     v5: https://lore.kernel.org/linux-perf-users/20261023054952.2503540-1=
-irogers@google.com/
>
> v5: Address Sashiko review feedback:
>     - Patch 1: Always record system wide, as 'perf timechart record'
>       does, as switches into a task and idle states aren't seen by
>       per-task events when only a workload was recorded.
>     - Patch 1: Don't move a task's state start back before its recorded
>       history when its switch out and back in were lost, which inflated
>       its running time.
>     - Patch 1: Serialize LiveRecorder.stop() calls from the UI thread and
>       the thread processing events.
>     - Patch 2: Only run the live recording test when scheduler events can
>       be recorded system wide.
>     v4: https://lore.kernel.org/linux-perf-users/20261023050207.2449976-1=
-irogers@google.com/
>
> v4: Address Sashiko review feedback on patch 1:
>     - Don't prune live history past the last event, so open states aren't
>       lost when no events arrive for a window, and don't count a still
>       running task's open segment as a switch.
>     - Keep showing the window at the end of recording, rather than jumpin=
g
>       back to already pruned history, and prune events flushed as perf
>       record exits.
>     - Close open task, CPU and I/O states when resuming after a pause,
>       rather than extending them across the unrecorded gap, and close the
>       running task when a switch away from it was lost.
>     - Stop perf record and close the files and pipes if
>       LiveRecorder.start() fails after starting it, and close the data pi=
pe
>       read ends in LiveRecorder.stop().
>     v3: https://lore.kernel.org/linux-perf-users/20261023041819.2361900-1=
-irogers@google.com/
>
> v3: Address Sashiko review feedback:
>     - Patch 1: Explicitly include <string.h> in builtin-timechart.c.
>     - Patch 1: Reject non-finite --window values (e.g. 'inf') that
>       overflowed converting to nanoseconds.
>     - Patch 2: Stop the fake recorder in a try/finally in the synthetic
>       live UI test so a failed check can't leave its background thread
>       running and hang the test.
>     Rebase onto the latest perf-tools-next.
>     v2: https://lore.kernel.org/linux-perf-users/20261014042249.2379829-1=
-irogers@google.com/
>
> v2: Rebase the remaining 2 patches onto perf-tools-next after patches 1-1=
1
>     of v1 were merged.
>
> Alice Rogers (2):
>   perf timechart: Add a --live mode to the TUI
>   perf test: Test perf timechart --live

Ping. The Sashiko feedback is now clean on these final 2 remaining patches:
https://sashiko.dev/#/patchset/20261113152622.1991001-1-irogers@google.com

Thanks,
Ian

>  tools/perf/Documentation/perf-timechart.txt   |   20 +-
>  tools/perf/builtin-timechart.c                |   80 +-
>  tools/perf/python/ttimechart.py               | 1334 +++++++++++++++--
>  .../tests/shell/test_ttimechart_python.sh     |  591 ++++++++
>  4 files changed, 1899 insertions(+), 126 deletions(-)
>
> --
> 2.56.1.703.gf848ed807c-goog
>
