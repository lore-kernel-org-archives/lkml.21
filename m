Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982141;
	b=cB7oG7LqSkVOX+i+BYzep3XCVEFQAl5ZfUB8x/LU6Hs0t0Nh/b+bGkiBaNpAmrIYp5aZ
	 hBZUdDIH9AA6koe/nGKI/S6GP8Y+asPir2H3o4poOmhR+FwvHFlVipDeyuZi03v0K7P0Q
	 v8wM58RJSIE9/erMcL8ap+esKIG/trbszlXagp8gE8pYqENDxPsskodIWQu0zFrGRwasF
	 4/eE6NCTgM3M9muerXhpxPAq3VuXZ6NHvBxbqXnyTjsuMvEcSt09ibTCJL+VknE539SPY
	 MqMFWnI9UyVWUZIwmBLwHp1Go0DazFFEtHHA2c/VKpK8UILTl/IFOfYgBuNlYAMF5NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982141;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=hDAVKUxd5qtHRxyEIWChofvlPqSC6zajAOsizwKxViY=;
	b=JbGKT7v8cuvYtNJVvOXD59rkdc4Ao4vPcdsaTj60js7DnQ0/rQ7SiqxfW5H2RyatmJl8
	 erntY2Jr3k09PEw+//aJjaocbT3hnII7H/DMw0fZpg0/9LpzhJ6ziJsx3a3l4C2iGp9d/
	 B6hFrtuotsw9oso0QoLhJrL+BjkF9b2dX1SL9rmgKw6d22+GVE8HoZ6cdsTKhYL7JirsM
	 7b2dITrT+RJto9qv365K5mmnbfPDqF6fokIgXwhdgo+cLEmhEqOkReNykSJo15JBiSbME
	 4Q8a/bvxfEYnwf7Iv6W5Afohs5bFrW5ooqHRVfFPG9zNb0eIeZDLB6XYo4q5fYllpMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=eAiMI8iA;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46165606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46165606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=eAiMI8iA
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso303106a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982140; x=1795586940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDAVKUxd5qtHRxyEIWChofvlPqSC6zajAOsizwKxViY=;
        b=U7sbfI4H7CWiPwX71/2V0uvGP55a6wmKT0JFsHQrEURJcKHmOrBwfma2F7Z0HifjSS
         hTHGmLAHldU5g6rWMbLPaBgECJeR0R0LApcWA+dv8LXSPxT64LP6LhFsRWvSFUXJaLnP
         NC7LQGbQH8J2DM6AT8fI3xWAb54ANxSCknyUc6Ed+VPq+8+Vssmr85+kjVVdTsmQtQSC
         f7OkcBn32NbGxEO8Sv/uEQiqBPGc11YjtjwXgEWSyfWeOXuwLxVHVDSXJDVp+/yBCNHd
         uZWfyMbMw0aivf73BwFM+oeR/1AdKFQZl5U42FhXM06x2kA/bNOeWi46N1805EwrRPRe
         fA1g==
X-Forwarded-Encrypted: i=1; AL+hErGK/o8k6uofzMZNDYqDz8PYwdwMw6rSH+KHzme0akNd1R/mD1ggagMO45bhyyF6ffjMhVDUbWzNBN5xMWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SQm+0LMzxC7kduAu8frz7r2L1YKuSDmTvJudcOKrZ4ljHHAKs
	2mv0j9VzOTcM7wgfVttD12jZIUCoEYdg3FsvfXzPRkUA3cnA8c/9Ukwrfd+bc30df3jFsvvQ1S8
	nQlYeZ7X1Ep26H1Gv1/622LQn+ADYODq/q4FIsM6DS/yDolo0DfD2bLHMQuYgvnyIPv47iEDMSK
	L3vq3qTIhBkcz0LUuvQO97DgLxoV8WBliwQWzW8DhKafA6YxTkFDRDprr+K5yx+21YJNQ5shmQw
	6SyM2bcXe13OKWD
X-Gm-Gg: AZFdTZdnpZMAZj9iH8xMoNHkBSiGB9WxjO4soQQk5ktvW8RTbSySn88wc4fXbp3AGP/
	7YQ5DQ4/ylDOmY0OHTm6t7FDdbjkZrrdHlPdiEJ8aMIvufOcNj/zlPI5vXvBeDwX85u36UFmzUx
	PJl5Dvmc3sUXHt1jv8Kw3Bb1t6YnOECn3OuIsoOFggtbr25WAbXaXMR97Qppo/tmF9/bQSS5lS/
	34XIcRfuLlCW6gEkTHdqvSop+jmyOKDlMImEgQL2GN1iS8LTiN9k+ypVcCLNmryWwWlBWA+Y8Cu
	tgPxvkrjUcbWEoiQHH6g8G0laptvjaFTb3mBVcbaXDNy/HpLRXb+fUjcBZiSAFC9WpbV9kv6Ew6
	kDPtuEhhw9FmJ/StqdTXQ1Lp8y8ZW+zYwj+cNYxTezr/tFyE7tUAhQCNzn3xK07FbZUTnMJcZT5
	Chl00JQSvwazbYOdseZnrzxtPwewyok/9i1+k=
X-Received: by 2002:a17:90b:558e:b0:3b3:c2bf:de33 with SMTP id 98e67ed59e1d1-3b3d07c9e9bmr1785199a91.40.1794982140470;
        Tue, 17 Nov 2026 22:09:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ab9f98bdsm3640542a91.0.2026.11.17.22.08.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:09:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so116352085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794982138; x=1795586938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDAVKUxd5qtHRxyEIWChofvlPqSC6zajAOsizwKxViY=;
        b=eAiMI8iAufMdo67Q0z8JB2gSIAB5Kjwp+foAcjwgVU6OxQ7c8qb6WaH1DtOD0wQPJp
         5YHCShmu3bpPegTIfALQ0xPaD47OvMnhaH9RoLr33X7YwiSJSQRzKN4l5JEm+QcvlJqy
         Wfl306ULKKgsS60h5GaaIXWmRkbcWyoRDOz18=
X-Forwarded-Encrypted: i=1; AL+hErFg82HnvPRViqRCkMoKWSTfuPMhmX6Vm+wbErVv9Xiq6o+zjlGsWTYyDyMsHAmOknEffxjRWI5gIZBa71U=@vger.kernel.org
X-Received: by 2002:a05:622a:50e:b0:55b:8632:6d42 with SMTP id d75a77b69052e-55d5a539184mr26035611cf.23.1794981730252;
        Tue, 17 Nov 2026 22:02:10 -0800 (PST)
X-Received: by 2002:a05:622a:50e:b0:55b:8632:6d42 with SMTP id d75a77b69052e-55d5a539184mr26035081cf.23.1794981729786;
        Tue, 17 Nov 2026 22:02:09 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d58ff0065sm14886841cf.5.2026.11.17.22.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:05 -0800 (PST)
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
Subject: [PATCH v4 3/4] x86/vmware: Add the vmware_record_panic_msg sysctl
Date: Wed, 18 Nov 2026 01:01:50 -0500
Message-ID: <4c5de34b10f579368b890eaa9333a2755886bad3.1794980455.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794980455.git.zack.rusin@broadcom.com>
References: <cover.1794980455.git.zack.rusin@broadcom.com>
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

Allow administrators to disable host log transfer on ordinary guests or
opt in on encrypted guests. Expose the boolean recording policy through
kernel.vmware_record_panic_msg using proc_dobool(), as Joel suggested.
Zero disables recording, nonzero integers enable it, and reads return
0 or 1.

Register the sysctl only after the logger is ready. A registration failure
leaves the internal default in force. Document that the log is sent
before kdump, and that disable_panic_notifiers_platform_list also skips
it.

Link: https://lore.kernel.org/r/4e73yd2ofpdzl6rptzvd74no3hnyfblknoq7wzxlw7f3zjbz7c@srfabx6lsusj
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
v4: No change.

v3: Document the platform list ordering and the disable switch, and fix
the short section-title underline reported by Sashiko. No code change
from v2.

 Documentation/admin-guide/sysctl/kernel.rst | 20 ++++++++++++++++++++
 arch/x86/kernel/cpu/vmware.c                | 15 +++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 608055d7ccc4..be2d5aa52362 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1680,6 +1680,26 @@ entry will default to 2 instead of 0.
 = =============================================================
 
 
+vmware_record_panic_msg
+=======================
+
+Controls whether kmsg data is written to the host's ``vmware.log`` on
+panic. This setting does not control the separate VMware guest-crash
+event. Writing zero disables recording; writing a nonzero integer
+enables it. Reads return 0 or 1.
+
+= ==============================================================
+0 Do not write kmsg data to ``vmware.log``. This is the default
+  for encrypted guests.
+1 Write kmsg data to ``vmware.log``. This is the default for
+  ordinary guests.
+= ==============================================================
+
+The data is written by a platform panic notifier: early in panic,
+before kdump, and also when a fatal oops enters kdump without a panic.
+Setting ``disable_panic_notifiers_platform_list`` skips it as well.
+
+
 warn_limit
 ==========
 
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 0c6f7248a665..8c8b6dd7c3e8 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -33,6 +33,7 @@
 #include <linux/reboot.h>
 #include <linux/sizes.h>
 #include <linux/static_call.h>
+#include <linux/sysctl.h>
 #include <linux/wordpart.h>
 #include <linux/sched/cputime.h>
 #include <asm/div64.h>
@@ -260,6 +261,16 @@ static int vmware_log_rpc(const char *buffer, size_t length)
 static struct page *vmware_panic_page;
 static bool vmware_record_panic_msg;
 
+static const struct ctl_table vmware_panic_sysctls[] = {
+	{
+		.procname	= "vmware_record_panic_msg",
+		.data		= &vmware_record_panic_msg,
+		.maxlen		= sizeof(vmware_record_panic_msg),
+		.mode		= 0644,
+		.proc_handler	= proc_dobool,
+	},
+};
+
 static int vmware_panic_log_notify(struct notifier_block *nb,
 				   unsigned long action, void *data)
 {
@@ -311,6 +322,10 @@ static int __init vmware_panic_log_init(void)
 		vmware_panic_page = NULL;
 	}
 
+	if (vmware_panic_page && IS_ENABLED(CONFIG_SYSCTL) &&
+	    !register_sysctl("kernel", vmware_panic_sysctls))
+		pr_err("failed to register panic log sysctl\n");
+
 	return 0;
 }
 early_initcall(vmware_panic_log_init);
