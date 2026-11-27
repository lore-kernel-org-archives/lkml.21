Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795774452;
	b=veKhEZVdNprSc2BgZ+Hi3T1g+DjZXumIqY5aiLPVUvCtFMk4oWztlgIUUuD8My89l5hX
	 nCwaLjZPIF0OuNvo01VgBKnO0S5RMLhCmnjUMDLx9FWf/X+4cJ2CAQNz1xyA+q5oz9NMO
	 5evwssGYGEsBon99qRcv6pxAgP942Y9BeJNFvN9zApfdSjFDDtfs8mak86mexNvorss4W
	 XzZYI4yhob05RqK/HfcYFy/Fay4b8IN0FECKUNTueUTlFbjfH6dC4mdfre9l6NCDsokOT
	 ThuzAOk0nprAyULmO/tQgqUPTmokjcjnb5JTfrQuBUq3Wo2QfkR56VkdIeX77kUNk8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=pnSZi82mVfZLS6PwIZVcWPzE7AlvW48La+q7lJF7NRc=;
	b=BMGN88pZN1+pPWdsQCB2daI21yf2jQ78sAlZVLZO2du3njnyt0AcaEZBaZAgzEEO2873
	 iR9q4ZNOFtr1W9d2arGWpAkFJQ4ObY0Eyr77/qHlDCyAdbavObGKDlYqkIsBz09AWppaf
	 tjaEYH92Pa/9sMeGUzqaA9I427EezlDbDrS6+OI/nZabJMqGNQ/oXpwUQdXirIHawoz0D
	 GE24Y0hUW0yRprxFWXPcyDVufydQYxYawqocaYFMbPXYzPqLJtdwkwYjYzA/Zpi45KrMw
	 Xh0OCvfekBx6HEXtb4mjWNosCOPmwhbDhLOm6ogG3VaNeZn9lmlzlt3tiedGaoHTmsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDGzarso;
	arc=fail smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092DA60A2615
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 092DA60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDGzarso
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1960734a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:14:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795774450; cv=none;
        d=google.com; s=arc-20260327;
        b=nh6TQW3Tt0H05YxR0QLoyJKoWBFb+7k20cPJrhr5AMhQlFWCG2Ht9ByW2XCw+5Bl6i
         6ie2wtCIM7eMlU5EHFyOmxs4B8uegJ7ugfqpBjnU+XS7FaSVotpgM2ZjG/4c6kL+nUi3
         V65mxpB7T05irGY/eMm+4yCeknKYM3l78EXepE0RyvZXnHuh34U/QsmzBnckEK0EugQf
         ygEMYmjBuFn6Oto1OCVuuJplhh4Jp7OJ0yR/HTMxrKFajSVnL8pnAmZ478R/mVTw3Uru
         uIdjkn7Ud2kLp4fn5lkD9HF1K+0+quFwD+CSvbA3q/GwAcH7t6AX6Jii1UrZwTsh3uV7
         uVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=pnSZi82mVfZLS6PwIZVcWPzE7AlvW48La+q7lJF7NRc=;
        fh=roukCrHQhsBbOQxYidwpa+o9PwMiMbUgZhNpVEaLpHM=;
        b=hjI7nCzEjCHT8UV3AE/NJ8E97izti1l/MTjTWt2ZuPW7BbFNOSjLcwrZpkB+x1T/jZ
         n9fOy3P6hq4GzNuIgO6bRRboLdRIrNbiLjuOOSizoDtXrwdITc22GAYNrSXgG+xHRbAa
         2HwwWF5Gq0rlpm3RscIlZgXTyfpW7k7UZ68xuOn7zsxr6PXcNwJuTsh9cJe6QNCgIT1G
         GCJ0928OrxNAKo6Bbc/hMUcjUTfRRXZZNt2f53hWqeQ+lNwpVcRw2BPDUAoh4v/wsTbm
         0MUseRd33n065DmRSPHSwNqR+/wO+VJ9TFe7NdarNsXeXqyJcNcW96tQ8sPCPNuwJ6AT
         94gA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774450; x=1796379250; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnSZi82mVfZLS6PwIZVcWPzE7AlvW48La+q7lJF7NRc=;
        b=YDGzarsoRdrYESd0WQH9jBHguYTwQ4MWdevK+E8KmC2uyYZLyscJgJwBjwonhC0NwT
         Bpl0R8s2k8kM3FuRv9FJf/wNwnI4Fc8/M8oqwnbMB+SuPWfh5FQpVSPenWXXWhy0LSkG
         sihB80deO7zB26y3FM3Qxo63SaGHV4Hlk0xud2yxHvlJcFdpP2r7KfcKkQcS7J5mMOIk
         yNq+7yigz9q0FaWoAyhrYX8dVr28Zsxpht995AvRZ0JNonpCR15863AMxYKEzaVj9BIN
         ZE+9pctjIYTqfK5r0M9n6Op5Mo20Hpx0XYCb1SgrrnlTiDwGGAuSqSE2STS7RkRnUD6U
         JwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774450; x=1796379250;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pnSZi82mVfZLS6PwIZVcWPzE7AlvW48La+q7lJF7NRc=;
        b=vJuncG0Pj5rb24zRKU6VRJ68unaPoXKT4tyQwEHAnPXACp9sugXNZttqWwopsafZc5
         e7Hdasa0nlCGE66BtHL/Oz12+NjiBLdrscHmIc3xDtS4CyDBu3aKOVKzUCSBXyMyMSzG
         etc/A3F2ymlTiS45Qx8Gb4E+XZ/ZIMnTuGPS60NA75NygN/9Uj7496k6pYlcgO2xXNkr
         zcGy3+fivdOkxDEPFQ/Tx7yOudlbX0pPoVWzs2dC6MEO+yYcdxbRne2/PZzHvKAwoJ6P
         zPqEOvOontif2Z07H5PRCLE2v/0jP1SRSP3gciW9IxKJSSEY2D/R6Mr+mELVjE0nedUi
         Ji5Q==
X-Forwarded-Encrypted: i=1; AL+hErEqJrLUdjHr7BSBNNq+r2IQTgM4qJO/e1h9dL9s1X41LDvnnpnx6qHxOKjn1rptvasIqliDWyUFmOSK2/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vdjLNtfR4qiSNiINI+BlRnS+KzXw9xIjrFQECWYf+Irg2eg2h
	I980zdfWV7OB3CaeZUWTc1nWD2kY8BWuzMhnkQdGtzq1T/di3chmd4ielYtpkiqub8RAQc1cREn
	6CrxY59AAwQFgsl0pTDwS/QjtijO12UY=
X-Gm-Gg: AZFdTZf5YTgyzNjso0NUIhR6zVnVID/W1DnQPqxKXTov5Z1qbdaR2EXISrXLUs6y/E1
	IM06cWbIckV5yafcAS1iWYdEg/soCWPmIKn0YGQJMaU74vOJDtth2BJKovC7ZM46abyStnkkaJj
	KAwQ+IBygiGWs0hWepwDgnbXOFe386GVuVyfboOxoc+SVXglhtwiEKSYtR34zt/0ulMV55VSK0F
	VASPLNpMVIONyrzvME15KDZ04/YgEmptjr2XCsEUJB+Jf8JEA5qnxNfwgkmeTjwwdYtqvjLZcHs
	3oD+8Js4d7nJK1qbK0oFUGd34lz6Ww8cAWNhN5t6zh23rDubAhgF8WUvra2PLkqj6XKezo9jrK7
	BWhGgQD0Ou9Hd/pK4WaSr+/EbieKx+6pVqR8HRs+tB6Cah79LJO8SBNXK2s2oqLL1K18MUnUm6P
	/FtH+vpsvPUwWaFCE9
X-Received: by 2002:a05:6402:44d2:b0:6b4:5d8c:95e2 with SMTP id
 4fb4d7f45d1cf-6ba37c7a0dfmr13780450a12.4.1795774450046; Fri, 27 Nov 2026
 02:14:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Abhishek Khade <abhishekkhade69@gmail.com>
Date: Fri, 27 Nov 2026 15:43:32 +0530
X-Gm-Features: Aa3M54oFJndZgHbtbGYTQ8JLkfWXcGRfcl4DQYm07uiwGxgi46GejzDgXxTGmzU
Message-ID: <CANspbQrVUG8h5ZWBW6croG=+VnDoseeJvPwid=gYazA4aKRjOQ@mail.gmail.com>
Subject: [RFC] bpf: Is an open-coded bpf_iter_mount kfunc wanted?
To: bpf@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

Before writing any code, I wanted to check if there is interest in an
open-coded BPF iterator for struct mnt_namespace mounts
(bpf_iter_mount_{new,next,destroy}).

I tested doing this without a kfunc in a BPF program first:
- Using bpf_probe_read_kernel() + bpf_for(), a BPF program can walk
  ns->mounts (rb_node) and read scalar fields like mnt_id and
  mnt_flags, though without namespace_sem protection.
- However, pointers obtained via bpf_probe_read_kernel() become
  untrusted scalars, so the verifier rejects passing them to VFS kfuncs
  such as bpf_path_d_path() or bpf_get_dentry_xattr().

If an open-coded sleepable iterator (taking namespace_sem during step
lookup and returning a trusted struct vfsmount * or struct path) would
be useful for BPF LSM / tracing use cases, I would be happy to work on
an RFC patch and selftests. If bpf_probe_read_kernel() or userspace
listmount() is preferred instead, please let me know.

Thanks,
Abhishek Khade
