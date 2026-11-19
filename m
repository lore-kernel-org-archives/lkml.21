Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052329;
	b=niPvTSmbmoTuiyzoI1tm1tDBxvW/tAxr8W0KwTEfiNm/AB/CNhLOIke60nV06CzQR8QN
	 +g4A0LUeKx6r0YGm3z3JF0S83BIUPGVG6gBHn1U4rQbYASipt1olKZpqU/H/ARUH5anHu
	 4Wf6apJYvlxDYTwj1wWFSrQ1nspFXUfXlJh45Gb2GERi4dEYh1n0AavSzJrksre11HT6e
	 BKGK0ws/t1w0voyVzn3XHPG68BWsRIVm7i2dPXJztEeeIV6voy4hUHntrhQdHDSrEM4Ju
	 ZB+yo5Q4IMm8qXnKwS/bNJf7WdMlNUFtrcGpLDHJKUo5h/qUvU6i2W5n3i6onpMI+1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gcZAzQRErEhi/30tXQCEs/NJ2fYhWCzHpxzm/WDlSD0=;
	b=YmmcpC/2HBs4jPdqX5jb5/g4fi3kHCCaQPT/t1IAZjQ5aGpwUdC7ZVuTzPpmBI0WXjGO
	 G3VSR8fSHQC5z4lhz96+sDoJceyBFeS1OkMovJgf8pN581M9YB1VKcVQ4u7rL3rHKNp+R
	 1cY+5FLO7+ubvXzjFW5Xm9GxsDM9tHeR1YbJIaZnBfzUvAlpLJdcpgYWjEGItZ+Pwv2bZ
	 gdjor3cgFNSuSarS4LELXMwXpU3qGMESxpX2RrBw5qX7nfub53NOCq+CBAzf+YqsXavQ4
	 gvk2mo7YvZwv1qU3KGG1MIAOoW7GTIhkpXnHVgYqQdsimKefiTe6xXsF+PZICwwyM3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EPcq1aFx;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABC4606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ABC4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EPcq1aFx
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-55c7445cf85so86061cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795052327; x=1795657127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcZAzQRErEhi/30tXQCEs/NJ2fYhWCzHpxzm/WDlSD0=;
        b=EPcq1aFxZC06Bxd9mGrGwXrR5rC3CIM8O8wHkp4+PHXbPXQh9CNDqWWGycs3Q5WQzA
         NzfXGv+aM8DmK0lbjgOc5cCjM8n1xh9h4Ds/mO8m2DpEXMS9K47FO+CIkRChwkw2eeE8
         8aITBnxvNYkLl2hdasJULz/TBicPU/zwuTyao9h2i0/eA2MLiKC5RQot2As2MjGw/PYJ
         ym06JCoOgcVah6ETNfT44HUg6ho3Luquss7X4AiU9ll3KxieSqCQKVFFZRfOr0N6DpgG
         PEk/fyG9PiMHg7BVLDNWZz/RgoYQyY8N1hJspQozZ/YA1np/aQ/6KDsGQbr2Ojynjrd5
         69Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052327; x=1795657127;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcZAzQRErEhi/30tXQCEs/NJ2fYhWCzHpxzm/WDlSD0=;
        b=W5FnW9gSa3yafO2p79dAGr77d/0Mpye2+6QapY53JDemk1IPtV6OpcTFNb/IA0wuxe
         pjNudFnjhObRgW727Cw/jZsy3IiR89wtLcB6nDSmFnkXfVP5ITHntzM99NS0O+9ZZC/i
         R0Gq6peCWiJI1zmcNr1AVv1epWR67205wMoYvVjQigtthqzRcM/A+E2JlIs5rm/nu13/
         Y8Usfan9U+QfRuCyWzxZ9dORhDQhiPc9e408xFA83jdONeiNnrkPLLYYUYlWVMch0zLp
         sRFaiwdXoU4b0OknMAjRfP+puEfcbwXkQ5fPivZ6DSktsvNBIQkrmidrt3pdL2c6o0xw
         u9Yg==
X-Forwarded-Encrypted: i=1; AL+hErENKe63ZtPrOlYap3wIbuBCz90KpaoRv9KsYgg/K+t5xra7It9bHo6d7jNVskzwFHZJS8XA4tOI+fMjHbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qb1NmslgpkV1n/KcIxPshLajk906SzMXSsCyZRHGWPKUAlzdL
	CezXf01zur2SalCxWkAgiQL3AQ2ZM6TfG3POFm93iZj1P7pQdDPFO3QEqNk0uAKHmQ==
X-Gm-Gg: AYBFou02noRg7DQ0D/1eYkTaLryuPi5Mz6bBZ2r95nlua42P7aRwIcYwrMLYbJ4TLV0
	my9o1Mez5EzV7W8ws+VYKSgrmzhLEtAuhI0xZ2Y0WLh22PxY7XCChtnjcJytaRF+M8DjNySBiiJ
	1TD0pHEYuvilyVc/82/YZhi5O9KqdObiuIt2/plL+CF2k9hopDo46U4FECGT9YntcrpsPR0Zx5m
	Nbaj4ZRfAexBfG47HTIx88V9RsNuon2aY7lqhoJwIPqaFHWnf2goaNdXGykq0fH1rXsBdLJyh3v
	UlyJoldia1iWIOmjZuafRbOEGR10uDonyWbB7KJjcV3aKPkQMia2Drp5JWw69MauWvZ/bDXhW77
	iDkhcULOVAdBK7ECAMB8uWDoSvmsqWiF/UACwrxGX/B/wuJVclJSGFKPaPjWyQ6zDOlE7gEQkr6
	MojtY0jTIvDatLNEWkMwsMGHv2myRbzClAHteep6XOgzFMsQootC8ruIN5Ols/o4RIFy5/qmVU4
	Vo2f8OfxBR1Xq6Ia83anC3riyHrtwBXIbWpMzknpkAJr05MGDcCemPyf5ceOdXqM+Bjof8w4PT7
	PFRtyopb8FB3urlREgVV+q6sMxLf4YxqmmOe0twvhZnik6fuJj6PHkV7rQ/9hNOiAGpwiBw=
X-Received: by 2002:a05:622a:53c5:b0:535:ce3:ee07 with SMTP id d75a77b69052e-55d6cc98a42mr2621201cf.13.1795052326505;
        Wed, 18 Nov 2026 17:38:46 -0800 (PST)
Received: from google.com (228.209.197.104.bc.googleusercontent.com. [104.197.209.228])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777ad9b65fsm2635302b6e.11.2026.11.18.17.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:38:45 -0800 (PST)
Date: Thu, 19 Nov 2026 01:38:43 +0000
From: Andrei Vagin <avagin@google.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: Daniel Wade <danjwade95@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/fpu: Put non-enabled dynamic features into init
 state on sigreturn
Message-ID: <av5TI7uMazFmWYid@google.com>
References: <20261117112640.1435-1-danjwade95@gmail.com>
 <a0c51547-a354-4dbb-9194-0b359ea604cf@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0c51547-a354-4dbb-9194-0b359ea604cf@intel.com>

On Wed, Nov 18, 2026 at 12:19:02PM -0800, Chang S. Bae wrote:
> On 11/17/2026 3:26 AM, Daniel Wade wrote:
> > On sigreturn restore_fpregs_from_user() restores the features the signal
> > frame carries and inits the rest, but both masks are limited to
> > fpstate::user_xfeatures. If the task lost the registers earlier in the
> > syscall, a dynamic feature it has not enabled yet -- XTILE_DATA before
> > its first AMX use -- still holds the previous task state, and
> 
> How could that happen?

The code relies on this: while a task owns the FPU registers, a dynamic
feature it has not enabled is in its init state.
restore_fpregs_from_fpstate() maintains that by restoring with
fpu_kernel_cfg.max_features (the comment there describes exactly this
case), and fpu__clear_user_states() does the same on signal delivery.

The 64-bit sigreturn path doesn't. restore_fpregs_from_user() restores
from the user buffer with RFBM and init_bv both limited to
fpstate->user_xfeatures, then calls fpregs_mark_activate(). That clears
TIF_NEED_FPU_LOAD, so the full restore on exit to user, which would have
put XTILE_DATA into init state, never runs.

If the registers still belonged to current, that's fine. But the task
can lose them inside rt_sigreturn: the first XRSTOR from the frame
faults and fault_in_readable() sleeps, or the task is simply preempted.
Switching out only saves the registers. It doesn't clear them, so the
next AMX user leaves its tiles there:

  CPU0
  A: rt_sigreturn()            A has AMX permission, XTILE_DATA not enabled
       sleeps / preempted      A's state saved, TIF_NEED_FPU_LOAD set
  B: runs, uses AMX            B's tiles are now in the registers
  A: back in rt_sigreturn()
       restore_fpregs_from_user()
         xfd_update_state()    XFD[18] set: B's tiles hidden, not cleared
         XRSTOR(frame, RFBM)   bit 18 not in RFBM or init_bv: untouched
         fpregs_mark_activate()
  A: exit to user              no reload, B's tiles still in the registers


Here is the selftest to rerpoduce the issue:

Subject: [PATCH] selftests/x86/amx: Check that sigreturn does not expose stale
 XTILEDATA

A task which has AMX permission but has not enabled XTILEDATA yet runs
with XFD[18] armed. If it loses its FPU registers during rt_sigreturn,
the restore from the signal frame has to bring XTILEDATA into its init
state as well. Otherwise the registers keep the tile data of the previous
owner. The task can read that data once its first AMX instruction raises
#NM, because the kernel then clears XFD without reloading the registers.

Add a test for this. A victim process keeps a known pattern in its tile
registers and spins on one CPU. An attacker process, pinned to the same
CPU, puts a valid tile configuration into its signal frame and points
uc_mcontext.fpregs at a userfaultfd-registered region. rt_sigreturn then
blocks on the missing page while the victim runs, and the restore runs
with TIF_NEED_FPU_LOAD set. After sigreturn the attacker stores all tile
registers with TILESTORED. The first store raises #NM and enables
XTILEDATA. All stored bytes must be zero.

The test needs two CPUs and a userfaultfd that can handle kernel-mode
faults, which is normally restricted to privileged users. It is skipped
if either is missing, or if loading TILECFG alone does not preserve
XTILEDATA on the CPU, since the stale data could not be observed that
way. A lost race can only hide a leak, so the test runs several
attempts.

Signed-off-by: Andrei Vagin <avagin@google.com>
---
 tools/testing/selftests/x86/amx.c | 445 ++++++++++++++++++++++++++++++
 1 file changed, 445 insertions(+)

diff --git a/tools/testing/selftests/x86/amx.c b/tools/testing/selftests/x86/amx.c
index 40769c16de1b..31268193c4cd 100644
--- a/tools/testing/selftests/x86/amx.c
+++ b/tools/testing/selftests/x86/amx.c
@@ -3,14 +3,20 @@
 #define _GNU_SOURCE
 #include <err.h>
 #include <errno.h>
+#include <fcntl.h>
+#include <pthread.h>
+#include <sched.h>
 #include <setjmp.h>
 #include <stdio.h>
 #include <string.h>
 #include <stdbool.h>
+#include <time.h>
 #include <unistd.h>
 #include <x86intrin.h>
 
+#include <linux/userfaultfd.h>
 #include <sys/auxv.h>
+#include <sys/ioctl.h>
 #include <sys/mman.h>
 #include <sys/shm.h>
 #include <sys/syscall.h>
@@ -478,6 +484,443 @@ static void test_fork(void)
 	_exit(0);
 }
 
+/*
+ * Stale XTILEDATA after sigreturn test
+ *
+ * A task which has AMX permission but has not enabled XTILEDATA yet runs
+ * with XFD[18] armed and without room for XTILEDATA in its fpstate.  If
+ * such a task loses its FPU registers during rt_sigreturn, the restore
+ * of the signal frame must still bring XTILEDATA into its init state.
+ * Otherwise the tile registers keep the previous owner's data, which
+ * becomes readable by the task once the first AMX instruction raises #NM
+ * and the kernel clears XFD without reloading the registers.
+ *
+ * The test pins a "victim" process which keeps non-zero tile data in its
+ * registers and an "attacker" process to the same CPU.  The attacker
+ * points the fpstate of its signal frame at a userfaultfd-backed page,
+ * so rt_sigreturn blocks and the victim runs in the meantime.  Once the
+ * sigreturn completes, the attacker stores the tile registers to memory.
+ * They must all be zero.
+ */
+
+#define TILE_NUM		8
+#define TILE_ROWS		16
+#define TILE_BYTES_PER_ROW	64
+#define TILE_SIZE		(TILE_ROWS * TILE_BYTES_PER_ROW)
+
+#define SIGFRAME_REGION_SIZE	(16 * 1024)
+#define STALE_ITERATIONS	10
+
+#define STALE_RESULT_CLEAN	0
+#define STALE_RESULT_ERROR	1
+#define STALE_RESULT_LEAKED	2
+
+struct tile_config {
+	uint8_t		palette_id;
+	uint8_t		start_row;
+	uint8_t		reserved[14];
+	uint16_t	colsb[16];
+	uint8_t		rows[16];
+};
+
+static struct xstate_info xtilecfg;
+
+/* The tile pattern used by the victim. It is never all zero. */
+static uint8_t tile_pattern(int tile, int byte)
+{
+	return 0x5a ^ (tile << 4) ^ (byte & 0xf) ^ 0x80;
+}
+
+static void fill_tile_config(struct tile_config *cfg)
+{
+	int i;
+
+	memset(cfg, 0, sizeof(*cfg));
+	cfg->palette_id = 1;
+	for (i = 0; i < TILE_NUM; i++) {
+		cfg->colsb[i] = TILE_BYTES_PER_ROW;
+		cfg->rows[i] = TILE_ROWS;
+	}
+}
+
+/* tilestored %tmmN, (%rax,%rdx,1) */
+#define TILESTORED(n, base)						\
+do {									\
+	asm volatile(".byte 0xc4, 0xe2, 0x7a, 0x4b, " #n " * 8 + 4, 0x10"	\
+		     : : "a" (base), "d" (TILE_BYTES_PER_ROW) : "memory");	\
+} while (0)
+
+static void store_all_tiles(uint8_t *buf)
+{
+	TILESTORED(0, buf + 0 * TILE_SIZE);
+	TILESTORED(1, buf + 1 * TILE_SIZE);
+	TILESTORED(2, buf + 2 * TILE_SIZE);
+	TILESTORED(3, buf + 3 * TILE_SIZE);
+	TILESTORED(4, buf + 4 * TILE_SIZE);
+	TILESTORED(5, buf + 5 * TILE_SIZE);
+	TILESTORED(6, buf + 6 * TILE_SIZE);
+	TILESTORED(7, buf + 7 * TILE_SIZE);
+}
+
+/* Return the number of bytes in @buf which match the victim's pattern. */
+static int count_pattern_bytes(uint8_t *buf)
+{
+	int tile, byte, matches = 0;
+
+	for (tile = 0; tile < TILE_NUM; tile++) {
+		for (byte = 0; byte < TILE_SIZE; byte++) {
+			if (buf[tile * TILE_SIZE + byte] == tile_pattern(tile, byte))
+				matches++;
+		}
+	}
+	return matches;
+}
+
+static int count_nonzero_bytes(uint8_t *buf)
+{
+	int i, nonzero = 0;
+
+	for (i = 0; i < TILE_NUM * TILE_SIZE; i++)
+		nonzero += !!buf[i];
+	return nonzero;
+}
+
+/*
+ * Configure the tiles and load the pattern into them with a single XRSTOR.
+ * The first XRSTOR of XTILEDATA raises #NM and enables it for the task.
+ */
+static void load_tile_pattern(void)
+{
+	struct xsave_buffer *xbuf;
+	uint8_t *tiles;
+	int tile, byte;
+
+	xbuf = alloc_xbuf();
+	if (!xbuf)
+		fatal_error("failed to allocate XSAVE buffer");
+
+	memset(xbuf, 0, get_xbuf_size());
+	set_xstatebv(xbuf, XFEATURE_MASK_XTILE);
+	fill_tile_config((struct tile_config *)&xbuf->bytes[xtilecfg.xbuf_offset]);
+
+	tiles = (uint8_t *)&xbuf->bytes[xtiledata.xbuf_offset];
+	for (tile = 0; tile < TILE_NUM; tile++) {
+		for (byte = 0; byte < TILE_SIZE; byte++)
+			tiles[tile * TILE_SIZE + byte] = tile_pattern(tile, byte);
+	}
+
+	xrstor(xbuf, XFEATURE_MASK_XTILE);
+	free(xbuf);
+}
+
+/* Load only TILECFG. XTILEDATA is not in the requested feature bitmap. */
+static void load_tile_config_only(void)
+{
+	struct xsave_buffer *xbuf;
+
+	xbuf = alloc_xbuf();
+	if (!xbuf)
+		fatal_error("failed to allocate XSAVE buffer");
+
+	memset(xbuf, 0, get_xbuf_size());
+	set_xstatebv(xbuf, XFEATURE_MASK_XTILECFG);
+	fill_tile_config((struct tile_config *)&xbuf->bytes[xtilecfg.xbuf_offset]);
+
+	xrstor(xbuf, XFEATURE_MASK_XTILECFG);
+	free(xbuf);
+}
+
+static void pin_to_cpu(int cpu)
+{
+	cpu_set_t set;
+
+	CPU_ZERO(&set);
+	CPU_SET(cpu, &set);
+	if (sched_setaffinity(0, sizeof(set), &set))
+		fatal_error("sched_setaffinity(%d)", cpu);
+}
+
+/*
+ * The test detects stale tile data by reading it back after loading only
+ * TILECFG.  Verify that this works on this CPU at all: load the pattern,
+ * then TILECFG alone, and check that the pattern is still there.
+ */
+static bool tiledata_survives_tilecfg_load(void)
+{
+	uint8_t *buf;
+	pid_t child;
+	int status;
+
+	child = fork();
+	if (child < 0)
+		fatal_error("fork");
+	if (child == 0) {
+		buf = aligned_alloc(64, TILE_NUM * TILE_SIZE);
+		if (!buf)
+			fatal_error("aligned_alloc");
+
+		signal(SIGILL, SIG_DFL);
+		load_tile_pattern();
+		load_tile_config_only();
+		memset(buf, 0, TILE_NUM * TILE_SIZE);
+		store_all_tiles(buf);
+		_exit(count_pattern_bytes(buf) == TILE_NUM * TILE_SIZE ? 0 : 1);
+	}
+
+	if (waitpid(child, &status, 0) != child)
+		fatal_error("waitpid");
+	if (!WIFEXITED(status))
+		fatal_error("tile data check child died with status %x", status);
+	return WEXITSTATUS(status) == 0;
+}
+
+static void victim_loop(int cpu, int ready_fd)
+{
+	char c = 0;
+
+	signal(SIGILL, SIG_DFL);
+	pin_to_cpu(cpu);
+	load_tile_pattern();
+
+	if (write(ready_fd, &c, 1) != 1)
+		fatal_error("write");
+	close(ready_fd);
+
+	/* Spin in user space so that the tile data stays in the registers. */
+	for (;;)
+		asm volatile("pause");
+}
+
+/* Attacker state */
+static int stale_uffd;
+static void *stale_region;
+static void *stale_staging;
+static volatile bool stale_redirected;
+
+static void *uffd_handler_thread(void *arg)
+{
+	struct uffdio_copy copy = { };
+	struct uffd_msg msg;
+	struct timespec ts = { .tv_nsec = 50 * 1000 * 1000 };
+
+	if (read(stale_uffd, &msg, sizeof(msg)) != sizeof(msg))
+		fatal_error("read(userfaultfd)");
+	if (msg.event != UFFD_EVENT_PAGEFAULT)
+		fatal_error("unexpected userfaultfd event %d", msg.event);
+
+	/*
+	 * The attacker is now blocked in rt_sigreturn and has lost its FPU
+	 * registers. Give the victim time to run and load its tile data.
+	 */
+	nanosleep(&ts, NULL);
+
+	copy.dst = (unsigned long)stale_region;
+	copy.src = (unsigned long)stale_staging;
+	copy.len = SIGFRAME_REGION_SIZE;
+	copy.mode = 0;
+	if (ioctl(stale_uffd, UFFDIO_COPY, &copy))
+		fatal_error("UFFDIO_COPY");
+
+	return NULL;
+}
+
+/*
+ * Copy the signal frame's fpstate into the staging buffer, add a valid
+ * tile configuration to it and make rt_sigreturn take the fpstate from the
+ * userfaultfd-registered region, which is filled in from the staging
+ * buffer by uffd_handler_thread().
+ */
+static void handle_stale_sigusr1(int sig, siginfo_t *si, void *ctx_void)
+{
+	ucontext_t *ctx = ctx_void;
+	struct _fpx_sw_bytes *sw;
+	void *fp = ctx->uc_mcontext.fpregs;
+	uint64_t features;
+
+	sw = get_fpx_sw_bytes(fp);
+	features = get_fpx_sw_bytes_features(fp);
+	if (sw->magic1 != FP_XSTATE_MAGIC1 ||
+	    sw->extended_size > SIGFRAME_REGION_SIZE ||
+	    !(features & XFEATURE_MASK_XTILECFG) ||
+	    (features & XFEATURE_MASK_XTILEDATA) ||
+	    xtilecfg.xbuf_offset + sizeof(struct tile_config) > sw->xstate_size)
+		return;
+
+	memcpy(stale_staging, fp, sw->extended_size);
+	fill_tile_config(stale_staging + xtilecfg.xbuf_offset);
+	set_xstatebv(stale_staging,
+		     get_xstatebv(stale_staging) | XFEATURE_MASK_XTILECFG);
+
+	ctx->uc_mcontext.fpregs = stale_region;
+	stale_redirected = true;
+}
+
+static int stale_tiledata_attacker(int cpu, int helper_cpu)
+{
+	struct uffdio_register reg = { };
+	struct uffdio_api api = { };
+	pthread_attr_t attr;
+	cpu_set_t helper_set;
+	pthread_t thread;
+	uint8_t *buf;
+	int nonzero;
+
+	signal(SIGILL, SIG_DFL);
+	pin_to_cpu(cpu);
+
+	stale_uffd = syscall(__NR_userfaultfd, O_CLOEXEC);
+	if (stale_uffd < 0)
+		fatal_error("userfaultfd");
+	api.api = UFFD_API;
+	if (ioctl(stale_uffd, UFFDIO_API, &api))
+		fatal_error("UFFDIO_API");
+
+	stale_region = mmap(NULL, SIGFRAME_REGION_SIZE, PROT_READ | PROT_WRITE,
+			    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	stale_staging = mmap(NULL, SIGFRAME_REGION_SIZE, PROT_READ | PROT_WRITE,
+			     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (stale_region == MAP_FAILED || stale_staging == MAP_FAILED)
+		fatal_error("mmap");
+
+	reg.range.start = (unsigned long)stale_region;
+	reg.range.len = SIGFRAME_REGION_SIZE;
+	reg.mode = UFFDIO_REGISTER_MODE_MISSING;
+	if (ioctl(stale_uffd, UFFDIO_REGISTER, &reg))
+		fatal_error("UFFDIO_REGISTER");
+
+	buf = aligned_alloc(64, TILE_NUM * TILE_SIZE);
+	if (!buf)
+		fatal_error("aligned_alloc");
+	memset(buf, 0, TILE_NUM * TILE_SIZE);
+
+	/* Keep the helper off the shared CPU, it would reset the tiles there. */
+	CPU_ZERO(&helper_set);
+	CPU_SET(helper_cpu, &helper_set);
+	pthread_attr_init(&attr);
+	pthread_attr_setaffinity_np(&attr, sizeof(helper_set), &helper_set);
+	if (pthread_create(&thread, &attr, uffd_handler_thread, NULL))
+		fatal_error("pthread_create");
+
+	sethandler(SIGUSR1, handle_stale_sigusr1, 0);
+	raise(SIGUSR1);
+
+	if (!stale_redirected) {
+		printf("[FAIL]\tUnexpected signal frame layout\n");
+		return STALE_RESULT_ERROR;
+	}
+
+	/*
+	 * The tiles are configured by the sigreturn above. XTILEDATA is
+	 * not enabled, so the first TILESTORED raises #NM, the kernel
+	 * enables XTILEDATA and the instruction is restarted.
+	 */
+	store_all_tiles(buf);
+
+	nonzero = count_nonzero_bytes(buf);
+	if (nonzero) {
+		printf("[FAIL]\tFound %d non-zero XTILEDATA bytes after sigreturn,\n"
+		       "\t%d of them match the victim's data\n",
+		       nonzero, count_pattern_bytes(buf));
+		return STALE_RESULT_LEAKED;
+	}
+
+	pthread_join(thread, NULL);
+	return STALE_RESULT_CLEAN;
+}
+
+static void test_sigreturn_stale_tiledata(void)
+{
+	int cpu = -1, helper_cpu = -1, i, uffd, leaks = 0;
+	int ready[2];
+	cpu_set_t set;
+	pid_t victim;
+	char c;
+
+	printf("[RUN]\tCheck that sigreturn does not expose stale XTILEDATA.\n");
+
+	xtilecfg = get_xstate_info(XFEATURE_XTILECFG);
+	if (!xtilecfg.size || !xtilecfg.xbuf_offset)
+		fatal_error("xstate cpuid: invalid tile config size/offset: %d/%d",
+			    xtilecfg.size, xtilecfg.xbuf_offset);
+
+	if (sched_getaffinity(0, sizeof(set), &set))
+		fatal_error("sched_getaffinity");
+	for (i = 0; i < CPU_SETSIZE; i++) {
+		if (!CPU_ISSET(i, &set))
+			continue;
+		if (cpu < 0)
+			cpu = i;
+		else if (helper_cpu < 0)
+			helper_cpu = i;
+	}
+	if (helper_cpu < 0) {
+		printf("[SKIP]\tThe test needs at least two CPUs.\n");
+		return;
+	}
+
+	/* Kernel-mode faults on userfaultfd regions need privileges. */
+	uffd = syscall(__NR_userfaultfd, O_CLOEXEC);
+	if (uffd < 0) {
+		printf("[SKIP]\tuserfaultfd is not available: %s\n", strerror(errno));
+		return;
+	}
+	close(uffd);
+
+	if (!tiledata_survives_tilecfg_load()) {
+		printf("[SKIP]\tLoading TILECFG resets XTILEDATA on this CPU.\n");
+		return;
+	}
+
+	if (pipe(ready))
+		fatal_error("pipe");
+
+	victim = fork();
+	if (victim < 0)
+		fatal_error("fork");
+	if (victim == 0) {
+		close(ready[0]);
+		victim_loop(cpu, ready[1]);
+	}
+
+	close(ready[1]);
+	if (read(ready[0], &c, 1) != 1)
+		fatal_error("victim failed to start");
+	close(ready[0]);
+
+	for (i = 0; i < STALE_ITERATIONS; i++) {
+		pid_t attacker;
+		int status;
+
+		fflush(stdout);
+		attacker = fork();
+		if (attacker < 0)
+			fatal_error("fork");
+		if (attacker == 0)
+			_exit(stale_tiledata_attacker(cpu, helper_cpu));
+
+		if (waitpid(attacker, &status, 0) != attacker)
+			fatal_error("waitpid");
+		if (!WIFEXITED(status) ||
+		    WEXITSTATUS(status) == STALE_RESULT_ERROR) {
+			kill(victim, SIGKILL);
+			waitpid(victim, NULL, 0);
+			fatal_error("sigreturn test child failed, status %x", status);
+		}
+		if (WEXITSTATUS(status) == STALE_RESULT_LEAKED)
+			leaks++;
+	}
+
+	kill(victim, SIGKILL);
+	waitpid(victim, NULL, 0);
+
+	if (leaks)
+		fatal_error("stale XTILEDATA was exposed in %d of %d attempts",
+			    leaks, STALE_ITERATIONS);
+
+	printf("[OK]\tNo stale XTILEDATA after sigreturn in %d attempts.\n",
+	       STALE_ITERATIONS);
+}
+
 int main(void)
 {
 	unsigned long features;
@@ -505,6 +948,8 @@ int main(void)
 
 	test_fork();
 
+	test_sigreturn_stale_tiledata();
+
 	/*
 	 * Perform generic xstate tests for context switching, ptrace,
 	 * and signal.
-- 
2.56.1.708.g77570a6a1d-goog
