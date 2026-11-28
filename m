Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795825130;
	b=zISXK2m0dqfcQWqR4hin4dlE6v7adJV1XoVt8GZOIwZMXk1kJhvGPyeLvZSxD4MIjC8s
	 fgZT6eJE+aR9+S//pGZOxa16QeYElrOobceGR/r0+DzFAPgm6/DGqbw1TECpxIdyTn0Pl
	 u89aCjalAfDyCiYmzZVdX4JQvFb7W8PhAjiNHqoZn4o9SsEvX7xGB9Y5XVF6dO1jCV/70
	 gERp3o6iwE9Ce68hdPQELgOIRoxnaCJx++pFzNoMhRTfKEFbykhO/kR9x2jeoW3icyrUi
	 z8vHE90d5ItSOI9qEsnJtEjdO1y+IGGbA3W/nlixI+UaUfnM5roLvjTWbHRZs/kcelw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795825130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6OQ2jIXGCbCx2gH2ueOTZDzML7ivwO7Wf75LpMaGfjc=;
	b=lfRhYxYzwGm/NEldl9hIEikddEK91bYOkr64NnVqWDWNu2oeDLZtBbaefgrEs7GNTazh
	 S++o6IteXiDYu//hs99eUunaGTeF+ARUD601z/mOTd0yTp2+8JomWa8J3gWGqbLYojySQ
	 JwWHW1mcKYLL59WPxUZK3Ixb1NA17S2EsHJQPxjaXrnvEYd4oeZzuwi73YWOn4WbsJQtp
	 eU/XUwdtbgrEjKJyrJ+0xjDH+TTI7gtKT++Vg2DbIyeNSPQc4163I7zUtKpXAgCLfgwvw
	 TXn8bzcZh7kHGKiewYNEF6c4NqitZDqSLHn1OeOEYFsENK5ujJBe4088BQfwWsUmtyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JnUNTTAg;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8CE606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA8CE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JnUNTTAg
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so3359515a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795825128; x=1796429928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OQ2jIXGCbCx2gH2ueOTZDzML7ivwO7Wf75LpMaGfjc=;
        b=JnUNTTAgGQMnp/NZtz9Q4EbRlnsgRUMB4k9QVABlBtWPPwV5kUIZt/coGm4oTrWT9B
         IFRyVLrNUNigaqA9qlscqhVPd590MwKx+nps6H/xZ4yiU+4DxBXWZL5wuVSKwDUSYKsl
         gJNaYSlLVnL573AUCEAT09jdiVmfFbPu/2DfbEuOklE4Tr0EjZNUS35lANqwY8Lknxto
         WsbzmyFVaZK+zmucVhzjJD+TXZN7AsdgNseURfTrcZIXSZ6ut1RvL//XSUo+EJDCSsPJ
         JOMDhIdRkkW7IPYJq0uUnPKotf1uvJeEqXs0qjCL7NAjlqtWpieswpRfKQuXn0EAexWO
         CUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795825128; x=1796429928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OQ2jIXGCbCx2gH2ueOTZDzML7ivwO7Wf75LpMaGfjc=;
        b=yHAPkG7SpUcsCDuqrOkHuTdzbXRz3jUHIjDz6IZ7kvk039WAOx1aULJqK0R/GCGRUA
         EkvUse9IuD44KLMGtgIGqv0YjogB1Uflm9VKE6px8PmCFBy/dWMh1CgBWFuZFZ+W8GHS
         JhBrpi1xtrtghExkG9TUOFrf1qGiNt2LON8PKLorxMLiZegzS2Yy9icXbICuBXmG7eTd
         8z+4jYZNmUwXq0pG2UPE+wwUlAg4x1ivVp+IY0/brZjMoh7XCutfdGBlrw5NOLSxg8HA
         AbKR/R+t+WhrSlOuwRAZCQPiN4aO77WqYk/oa7mG4M8/Eqipi8pI+QkRD1nYEtOkj6Kb
         QaPQ==
X-Forwarded-Encrypted: i=1; AL+hErEJ2Hde8KNUd58bD77u8gruurkhMBHAIGd6yqkVwZ6r3IVDTg3OCjA8TmCm+yel002jGQ83uLAFAdd6wew=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cLfMHoMCW72gNaCYJLk69T3fyjmaQEHYQNYVVVWCNKK5fi6bT
	g/XoKp3HkB3vtLNp5CcNegvneVCJoN5nqV4mZWkyQEvugjfOMGqqnNhx
X-Gm-Gg: AZFdTZcY9f/Ns6A4tt3CJZ8dQ94kfh3OFpiBWubJytZ5oVHHGNmbrUvql84iC5iV0LK
	Bh0hy+FhAJXqRQ89l+hyGojiiO5P6DwAJk1ud3N/oONZ4kY/exvtGZj5XREPUDiAx9g+RpDRMih
	ng4pN8TrDiibsUbhomofTSH73baNgzYt1qg64dKNyFMZ6mwIrPcLXiZYp6KCqm6t36P9lc57HM/
	XSZ7VGIsXNlDuvUbe9/exX4zu6XQJS3mH07aTKx+EHT817g2PRC9aHSbOoden7U/WcyFFGkf3vj
	pc/8hLRcqklWwh3uL9AOyXCZVxATWHKEtj9KWo2yQfKbBvAuJf8sd4k/+fuERRNaTMVM5eV7pfy
	zhhXVAOgC1QST5FWSv5Vf7MhkMydxgXT8w0wWY1+xWEIGu1OUE7MaNrk6SkurcFMrtsxWgo6lAO
	fiGJLaJuRpbLu8LlTX9NJJe8noL3STsSU5L0g7dm5I+RfzFlR1Zrr69Ji0MtAwX4wX0FN96WmEP
	Sgppno/4GgSWaBilrfleS/+hBvDE5g/wUZqiFj27E5p5ZTCkuL4+i4o+j1db778qDl8ksgDKRUf
	2nXdjEx+g2pZuSBN2VInsk1nq36q9w85NYqbN37j6GUsXRD7djPbUKfUyrIYR2P5+bj+oF3j
X-Received: by 2002:a05:6402:c47:b0:6b5:4baf:ad96 with SMTP id 4fb4d7f45d1cf-6ba37e6ee57mr18746128a12.17.1795825127925;
        Fri, 27 Nov 2026 16:18:47 -0800 (PST)
Received: from localhost.localdomain (17-33-201-31.ftth.glasoperator.nl. [31.201.33.17])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1ca4ff7bsm4753610a12.8.2026.11.27.16.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 16:18:47 -0800 (PST)
From: Tom Roozen <rzn.tom@gmail.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] bpf: hard lockup with ringbuf used from NMI and sched_switch on hpet clocksource
Date: Sat, 28 Nov 2026 01:17:20 +0100
Message-ID: <20261128001825.38905-1-rzn.tom@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Hi,

A BPF ring buffer written from a perf_event program (NMI context) and
from a tp_btf/sched_switch program hard-locks my machine within about
a second when the clocksource is hpet. On acpi_pm it doesn't hard-lock.


Environment
-----------

- AMD Ryzen 7 7735HS, Lenovo ThinkBook 14 G7 ARP,
  BIOS P6CN22WW
- Kernel 7.3.3-1-default (openSUSE Tumbleweed), x86_64,
  PREEMPT_DYNAMIC (full), HZ=1000
- The TSC is marked unstable at every boot, so the kernel selects
  hpet:

    TSC synchronization [CPU#0 -> CPU#2]:
    Measured 5354294254 cycles TSC warp between CPUs, turning off TSC clock.
    tsc: Marking TSC unstable due to check_tsc_sync_source failed

Reproducer
----------

Source at the end of this mail. One BPF_MAP_TYPE_RINGBUF (16 MiB)
and two programs:

- on_sample: SEC("perf_event"), attached to a
  PERF_COUNT_HW_CPU_CYCLES event on every CPU with freq=1,
  sample_freq=8000
- on_switch: SEC("tp_btf/sched_switch")

Each reserves 64 bytes with bpf_ringbuf_reserve() and submits them.
It reads bpf_ktime_get_ns() before and after the reserve and keeps
the longest reserve time in a global variable. User space consumes
the ring buffer, runs 4 pairs of threads passing a byte over pipes,
and prints the number of events and the longest reserve times once
per second.

  ./hpet_rb 8000 60


Results
-------

Clocksource switched at runtime through
/sys/devices/system/clocksource/clocksource0/current_clocksource:

1. acpi_pm: ran the full 60 s, ~148500 events/s. Longest reserve
   at the end of the run:

     148638 events/s, longest reserve: NMI 0.112 ms, sched_switch 0.159 ms

2. hpet: produced a single log, then hung the machine:

     693 events/s, longest reserve: NMI 500.810 ms, sched_switch 1001.174 ms


Additional test: read_hpet() replaced
-------------------------------------

To check whether the HPET read path is involved, I also used a
livepatch that replaces read_hpet() with a plain readl() of the HPET
main counter.

With the livepatch enabled, the reproducer ran the full 60 s:

  537229 events/s, longest reserve: NMI 0.034 ms, sched_switch 0.036 ms

After disabling and unloading the livepatch, running the reproducer hung
the machine instantly.

My reading of the code: a CPU can be inside read_hpet() holding
hpet.lock when a perf NMI arrives. The NMI program then queues on
rb->spinlock behind a CPU that is in on_switch. If that
CPU is the queue head or pending waiter, its check_timeout() calls
read_hpet(), which waits for hpet.lock. hpet.lock is held by the
interrupted CPU, whose NMI is waiting in the queue without a timeout
of its own.

Thanks,
Tom Roozen


---- hpet_rb.bpf.c ----

#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

struct {
	__uint(type, BPF_MAP_TYPE_RINGBUF);
	__uint(max_entries, 16 << 20);
} rb SEC(".maps");

__u64 max_ns[2]; /* longest bpf_ringbuf_reserve(): [0] NMI, [1] sched_switch */

static __always_inline void emit(int i)
{
	__u64 t = bpf_ktime_get_ns();
	__u64 *e = bpf_ringbuf_reserve(&rb, 64, 0);
	__u64 d = bpf_ktime_get_ns() - t;

	if (d > max_ns[i])
		max_ns[i] = d;
	if (e) {
		*e = t;
		bpf_ringbuf_submit(e, 0);
	}
}

SEC("perf_event")
int on_sample(void *ctx)
{
	emit(0);
	return 0;
}

SEC("tp_btf/sched_switch")
int on_switch(void *ctx)
{
	emit(1);
	return 0;
}

char LICENSE[] SEC("license") = "GPL";

---- hpet_rb.c ----

/* Usage ./hpet_rb [sample_hz=8000] [seconds=60] */
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <linux/perf_event.h>
#include <sys/syscall.h>
#include <bpf/libbpf.h>
#include "hpet_rb.skel.h"

static long events;

static int count(void *ctx, void *data, size_t len)
{
	events++;
	return 0;
}

static void *consume(void *rb)
{
	while (ring_buffer__poll(rb, 100) >= 0)
		;
	return NULL;
}

/* Two threads passing a byte back and forth to cause many context switches. */
static void *pingpong(void *arg)
{
	int *fd = arg;
	char c = 0;

	while (write(fd[1], &c, 1) == 1 && read(fd[0], &c, 1) == 1)
		;
	return NULL;
}

int main(int argc, char **argv)
{
	int freq = argc > 1 ? atoi(argv[1]) : 8000;
	int secs = argc > 2 ? atoi(argv[2]) : 60;
	static int fds[4][2][2];
	struct hpet_rb_bpf *skel;
	struct ring_buffer *rb;
	pthread_t t;

	skel = hpet_rb_bpf__open_and_load();
	if (!skel || hpet_rb_bpf__attach(skel))
		return 1;

	for (int cpu = 0; cpu < sysconf(_SC_NPROCESSORS_ONLN); cpu++) {
		struct perf_event_attr attr = {
			.type = PERF_TYPE_HARDWARE,
			.config = PERF_COUNT_HW_CPU_CYCLES,
			.size = sizeof(attr),
			.freq = 1,
			.sample_freq = freq,
		};
		int fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);

		if (fd < 0 || !bpf_program__attach_perf_event(skel->progs.on_sample, fd)) {
			perror("perf_event");
			return 1;
		}
	}

	rb = ring_buffer__new(bpf_map__fd(skel->maps.rb), count, NULL, NULL);
	pthread_create(&t, NULL, consume, rb);

	for (int i = 0; i < 4; i++) {
		int a[2], b[2];

		if (pipe(a) || pipe(b))
			return 1;
		fds[i][0][0] = a[0], fds[i][0][1] = b[1];
		fds[i][1][0] = b[0], fds[i][1][1] = a[1];
		pthread_create(&t, NULL, pingpong, fds[i][0]);
		pthread_create(&t, NULL, pingpong, fds[i][1]);
	}

	for (int s = 0; s < secs; s++) {
		sleep(1);
		printf("%ld events/s, longest reserve: NMI %.3f ms, sched_switch %.3f ms\n",
		       events, skel->bss->max_ns[0] / 1e6, skel->bss->max_ns[1] / 1e6);
		fflush(stdout);
		fsync(STDOUT_FILENO);
		events = 0;
	}
	return 0;
}

---- building the reproducer ----

clang -O2 -g -target bpf -c hpet_rb.bpf.c -o hpet_rb.bpf.o
bpftool gen skeleton hpet_rb.bpf.o > hpet_rb.skel.h
cc -O2 -Wall -o hpet_rb hpet_rb.c -lbpf
