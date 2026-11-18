Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981720;
	b=od5T3dSVpMGkeZI7iY3+rBXvQPI3y8Tx/ceBeiIyGS5dLIzI/H4J94MHHtB21BdYyi41
	 7LPLVbfNxwllrIfdRZ38zR5BWVlE3A1lCpVw9pn1brPrdeGpAYHjPzDoJSQmLI19JoYPt
	 HDC6Py3PJ/mc//dydxyRkyZ3H+rFnQzk9G9fWkCcOVKi/mYffrcGdl/c3bSOx3Ej0J1rC
	 S0CmazAcFp0olqnBNxz52068LstRnRxUAnnczMQmfPj8ATV+tDF61G4A6MQkwuRtul7ZM
	 cZeyYP0qKZdhPw8p2uI1H0sPj3SprI25E9YIF0L3Rv5Mm70IQVEiZ2q7MSZX8wX0a6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981720;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=AxEJOEfcnyLje8ZmMvx2AZyT7iZftuKYAFChF/A8Hek=;
	b=jTuDuyVOj8/TQWhuunAJ7EbWx8o3FuWC0B2twe08COSQxwnbDYjK8SAOiW6URfQg5e/B
	 uwS9q/9Yl5q4U0VGBnaEqbg/qC8RzYA7CKR1yykG1x/0rHi4EPXwaFu5A4WnSanlXrt+K
	 1n6eumWoMBN5awXSqkyUWWVWwp2nrQ37tO9IwL3GFANyFSM///CqG5gqFHmoCrnxYvB7y
	 az9FkkMeqIWt524je1U9BO3DpbRO1Z2dwoWKrjDPBW7+Apm0ct4bsyzI3m5kHs8E/5w0T
	 fUgnoftq0HzdwN+HznUJk0ULR9ppb9SREYqxib+Sp1cgClPQMkJ4UW5mPPw0aCvu2Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OizJWoqO;
	arc=none smtp.remote-ip=209.85.217.97
Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B39606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9B39606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OizJWoqO
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-7d2dbc0a8d4so195967137.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981719; x=1795586519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AxEJOEfcnyLje8ZmMvx2AZyT7iZftuKYAFChF/A8Hek=;
        b=TK5yu2YbEs8T4dWuWRgeRjLNXrpyr4p0piwpWURzWodcqtPXippI2Fa3/8L928AdXQ
         iUojbrZX8dn8805oGRTYJ7nuSObj0gmLe1muO62TbrojE5tVT9lgBo26iWryGm4+FbQM
         18kYbv8mHtpCdh6/nUOHUAQqteEfunRLj8+EQqd9RX+YGcAOxEF5DD/0GX9/WvmK/DXo
         ayqAgk4wfQnGuULsjhJzI1LFRh9qCuCbZxAArEUzDCWa69//uxSz+7DOibwxyb9grj3+
         mw1kOEVcvVKtg2ToLgrM0B4meOOeCHEzbs83wXwUwAY9XKv2XH69bL28sbZMYBVlH239
         T8bQ==
X-Forwarded-Encrypted: i=1; AL+hErHfiUWKTVD6ID9sJeDWC3C//1jq8+85Ts9dYW2lmj6lTXfZMjmmeygC/TxmBzsC9h37F1yBVQw/6bmIzco=@vger.kernel.org
X-Gm-Message-State: APuU4Z8heaN98nXf2ERyLWyJ6UPDKNTOv97xpjtalNLNcYqV4L5VqBll
	DMrRN5/UtysdQGmE2Gap3bLYaL/hIGE/pUmXtKPnUwE7eQ1uH2PlC125w/VLzKXxZDxDqAjXVXG
	mcERjszgR7ZTL9oumr2w72s7aQGBxPFcwgjpKmOICS9vvBHgDi++8x/yJRvLQm+JS15Yp28/uOe
	ospxpucJjV4PHWci2sMb9hq33/KI8bGHBmilmZ5JnzYD/LwRt1VQjqSfAQcSRsSZMeiPEeDTFCQ
	PyMJraqcrRClU0N
X-Gm-Gg: AYBFou3ox+NBaNBlMJe4SyqIGDFFvHmygjyBM65dqDO+FHUrPQCqPMwSjNO52X37drK
	jJV5D2/unkVKx/4PYaPKo2zJmEL649Ikq7TUuaRAqNRWKL/SKtdXyPhZpxYUjDl9ksYn96k6Yyn
	K7aiBMo6rFc3+vAXjuAYV4b9Cq4jx/irjV4jt4hP7KUE3CNhwBmP23E+bMnIl5QBwN83Jv90KsQ
	2CO8Ly7CH7nPgOFI3PIjU0FeHE3mCImOfh1S/MdJ65li/9jkdIrgk5YrtOAvt8Vwny2HI1kD9fX
	dxPb342mTYLQLKW3/AgwIMKOZkzsPKGuI9isZllf/iR+LfFxZbthEWIp5wHYimF1Vi3+mVjwzHw
	WmNo8s4JSrozDOTT3DkdIatSbw48MtVgSX0CSeilLyyW24eyO840QH9/djtTdExuFc+QHcfPZqa
	97b1FYzcK74HMEJ/mrDh9dzpGnwUaFqwSv5T4=
X-Received: by 2002:a05:6102:6f07:b0:7c8:1fd5:82b5 with SMTP id ada2fe7eead31-7d6ba404626mr331164137.14.1794981718566;
        Tue, 17 Nov 2026 22:01:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e4a656fa1sm165083241.19.2026.11.17.22.01.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:01:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d2c49c3d9so9098441cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794981717; x=1795586517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxEJOEfcnyLje8ZmMvx2AZyT7iZftuKYAFChF/A8Hek=;
        b=OizJWoqODaIb4n+f18M2B89f+yEv0LPexoIKqjSd2SAblHASna5g4d5qF837ZeRDrq
         TJQWPbIZ0J44/yC76I4P7Ls2GbVC8HfmLOma9zV9FTEN0u9xLHNH8nKk0xP4z7yIL/eU
         g651w8vsB+3sF/CFXRKf7ChGNkYJUH48G+7AE=
X-Forwarded-Encrypted: i=1; AL+hErEzpN+oSo9K7X/FCpx8Wn4URzzZtSTM8Lb8aD1wm2bRWcVN6Pfsk7kXjCflE3Y1YlEcj/Tz1Q48ycXWmv4=@vger.kernel.org
X-Received: by 2002:ac8:6f0b:0:b0:54a:755d:6fcc with SMTP id d75a77b69052e-55d5a2c46b1mr26201631cf.4.1794981716713;
        Tue, 17 Nov 2026 22:01:56 -0800 (PST)
X-Received: by 2002:ac8:6f0b:0:b0:54a:755d:6fcc with SMTP id d75a77b69052e-55d5a2c46b1mr26201071cf.4.1794981716159;
        Tue, 17 Nov 2026 22:01:56 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d58ff0065sm14886841cf.5.2026.11.17.22.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:01:55 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>
Cc: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH v4 0/4] panic, x86/vmware: Preserve crash logs before kdump
Date: Wed, 18 Nov 2026 01:01:47 -0500
Message-ID: <cover.1794980455.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This series lets VMware guests copy the end of their kernel log to
the host's vmware.log when they crash, before entering kdump. This
preserves diagnostic information even if the guest cannot save its
own logs or the crash dump fails.

Using the existing panic notifier list for this would require
crash_kexec_post_notifiers=1, which also runs unrelated callbacks
before kdump. Following Petr's suggestion, v3 instead adds a separate
platform panic notifier list for callbacks that need to run early.
It runs before kdump and before stopping the other CPUs. It also
covers fatal oopses that enter kdump without going through panic().
The callbacks run at most once, and the list can be disabled for
debugging with disable_panic_notifiers_platform_list.
crash_kexec_post_notifiers, the existing panic notifiers and the
kmsg dumpers are unchanged.

The VMware log sender is the first user. It uses a preallocated
8 KiB buffer and limits both the transfer size and the number of
retries. Logging is enabled by default in ordinary guests; encrypted
guests must opt in through kernel.vmware_record_panic_msg. The copy
is best-effort: kdump and reboot do not depend on it succeeding.

The separate VMware guest-crash notification, which can cause the
host to terminate the VM, is a kmsg dumper registered late in boot,
so it runs after the built-in log dumpers. It is suppressed while a
crash kernel is loaded.

Changes since v3:
- Call the platform list before taking the kexec lock in __crash_kexec(),
  so a callback that panics on a direct crash_kexec() can still enter
  kdump (reported by Sashiko).
- Rebase onto v7.4-rc3.

Changes since v2:
- Replace the pre-kdump list and postponement parameter with the
  platform list and a debugging switch to disable it.
- Run the list in vpanic() before the other CPUs are stopped,
  instead of just before the kmsg dumpers.
- Correct the sysctl documentation heading.
- Rebase onto v7.4-rc1.

Tested on x86-64 guests on VMware Workstation, ESXi (ordinary,
SEV-SNP and TDX) and QEMU/KVM.

Platform list proposal:
https://lore.kernel.org/r/ateYxCu63pRY9EGq@pathway.suse.cz

v3:
https://lore.kernel.org/r/cover.1794201807.git.zack.rusin@broadcom.com
v2:
https://lore.kernel.org/r/cover.1790014793.git.zack.rusin@broadcom.com
v1:
https://lore.kernel.org/r/cover.1788414671.git.zack.rusin@broadcom.com

Zack Rusin (4):
  panic: Add a platform panic notifier list
  x86/vmware: Add a bounded panic log sender
  x86/vmware: Add the vmware_record_panic_msg sysctl
  x86/vmware: Report guest crashes after kmsg dumpers

 .../admin-guide/kernel-parameters.txt         |  12 +
 Documentation/admin-guide/sysctl/kernel.rst   |  20 ++
 arch/x86/include/asm/vmware.h                 |   2 +
 arch/x86/kernel/cpu/vmware.c                  | 250 ++++++++++++++++++
 include/linux/panic_notifier.h                |   3 +
 kernel/crash_core.c                           |   8 +
 kernel/panic.c                                |  51 ++++
 7 files changed, 346 insertions(+)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
