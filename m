Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794961534;
	b=vOJBYyv2i+HcBdqQJZ+mYkrJQgPCRqCsySZnLgUZGupcfueMQGvvtyaDmvVGlutf1tu8
	 lfMcGPsIZcleiFXrz/96fAiaQu8YCzLVqkOVRIFM2JnZ03yZsF7+PfiFVFePQU+TDJqg9
	 FfAHIGOQ7WFyAmNK0dfDuLP3Yoh4hsSk41cj8gcnQAKSHAtyF9ixVbddG/Mfnwu1XxHhO
	 8lpuuNNoLM1E5+lPiD9ZBQ8QZ9hesxlxHIkkaFCRKo97WhOc8n19mVW7lEnfWmaBKCEWd
	 N6iB4eU0HhnUfUGijiG811181ur/apqitJffQy3p6Se0iHBxkf4DC5P8eqRwYKVGzVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YOsED0g/bd1ZFHc7sB4ziCibNPUUgz2EiQJdiyX05eE=;
	b=BHqHfYkt2WSPoyHTHndMVSlsD5qz8iOEI0H8HRyIve5bpkLTqflMBgUMnP+kb0UJgaRf
	 IGhbeA2RNvbgrVhPfTu/r87jTXtDO9y8afARC9CmZijQ3WYf6GKswFpMiqnsHCB5eVoh9
	 qneI3ChoK1RtzCTVnYCLgD75ffqsURnROIKRJ3yCFBye++cWIFa0VAl1jMcaQSfjE0XG4
	 6EbNDEWO4FbZonvhseds97UcRYwyxvFwdoLIbrrVnwT6BRnkTasj7+bjLYbw3MmjsB4Ag
	 h0p6ozH381gZkMTd+8l7Exdo9TUdYglTfUuPiNxYdZc/ssImkuUjCohST6WQiTLEgAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBRvclcE;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE39606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBE39606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBRvclcE
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso193742a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961533; x=1795566333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YOsED0g/bd1ZFHc7sB4ziCibNPUUgz2EiQJdiyX05eE=;
        b=fBRvclcE6DV+QVl1fn5PVAdkf4Ap78GiiTNsA/hCvlkDe8tnEJGuDifjgFZ1PL1qaa
         04eHV5oPKnnSEUW2jtif2P4s4pCyTsZz927Qp3K3i/t1piC8Lo3M4U1IoXMyipM1BAer
         WdsRYqd+6v8M80crHGhRi66FmeSxkc/KaPMcrhj99/+ktBJ8Q30p4LZjGyrDgK4smy/+
         5k7an5IQ6lSArzZ2shka6Xoq3Bdx+2KAvpNJE/ukoXF6hOyspDsknReUgPvKLbtBPVuU
         Jb/bnrke9cHXC0Dza4xH1qwy8NYXl4G1zN1jsaJsVOmpd4SK6rEopSO7ubp31dPmb/rS
         dhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961533; x=1795566333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOsED0g/bd1ZFHc7sB4ziCibNPUUgz2EiQJdiyX05eE=;
        b=YeyFX3MJZrFLPT7W4KV5e5KqHv3LQaSq/0gr3A1AkmVI7vciepgxcXgKmMh0zNg1WM
         ZuBrd1L7rnYbIJGeyOffVafrIWqT6LK6LGWPs5aA5OuYBGKqLtjD1hVQjvHBDFcfMfE/
         PN4fAh4Hhjo1G4YWwtHhkCWJTEvyM1jNEh5596FVReYjWpb4jTGc550Hq47CXgXmeoFA
         dyWiw3+IwtPXuPT8fR7Tp8jZSa1G8MveL2r7GWmSDHcp0Sa677xWFVQThu7nth9AkI1z
         /igOjp9jX+VEvzHIUySEsqNmldbWem5tNbj4wyP/ZZ7f+slwJdGfTnEQ1AaE3NhB7dVh
         fZnA==
X-Forwarded-Encrypted: i=1; AL+hErE0Gi0vZ3bnVlieCKG+4VoWw/hoO8fenonuIhhx7CybvWci94ShUDM8Ko8NhaDXftoJKrKhx0YAh9LimvM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TJXUB5qHekJ22UOkmpUmjP74hYIE4Guq9Z416K2vUEO1+kEjk
	TQEGadlxwfMR9Q6OxCtEXQa1ZVHAyqh+mz4D1sNCWt3RX792I8s+E0rW
X-Gm-Gg: AZFdTZed9uZdpCViHVNT7pw4aXbHgQ9WmD1teTyYpwcfmysNeo8DN+57lTbGtBYnuat
	PA6QC4hN7SYOHrytm+AOYd2BPoyUvLytR3RBCFEbmUMV8JmHeAmLYZAOFFHZF/GxJ9QlSeSphuR
	00Nx+FLW2h7a7l3zj+HWzXJU5poVcToriohLjzJEPRpH7UJ3II+Uz7HxkyFcjitLvLIStM8tHm5
	Wugsu6yaIJ2OreMEW3ShNE5Bxgu6p2aGGttC1bIvkVzons8N6s8ELom9EPsHjt1vTlkS2RCo8uA
	VfNbin6t/a0xh8yO8LtNbvsfIf1MYZARi7+wpa0Wu+NmhSm1gxN8/S/V89KXztAuI4QxvUAGoFh
	0xSn5MnBj/Fcrx5qJlvnWTAVSEd9ZXabKAWbZKWvN0ozzl+gxsBKAczF9gAKZ6QRhnCZ/oUvfcd
	W09vjPCqQK9M/BJKrg0Loz09r6//QnY/9GHARK69JmhsuWItxIrtB5OPWX/tfRqPqt4t2p9Xmrg
	4n/fbl8Enx4QTQ5nSgpXhHVXj8GfYoaeuvVLdpiTjGgyLQY73ZeT4w5jJYB9GnQZ1F2GelRyU3G
	wYRGLzi9GlSzGuHFxN/oukoytreibzc+Tumg96K7sbNi0hCopps5+hMoWUJef1cPdCFm1/BtdtF
	ejqWdHfztXaSAvTVQb7Fw1PhjJSD9g0lJQP71YgMtGP/XBvN4WX6SycLUWeSYrkKGpt27tv6fCA
	fb8CDnnhqBSv6Ok6Z+8SJFjIZ5CNBtB1uoC0iyfL0MtsY/OB7EWSx4lrM5nM2jTA==
X-Received: by 2002:a17:90a:d444:b0:3aa:fc22:8aad with SMTP id 98e67ed59e1d1-3b3d07c23bfmr1013734a91.54.1794961533262;
        Tue, 17 Nov 2026 16:25:33 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c04020sm1212211a91.17.2026.11.17.16.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:25:32 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Allen Pais <apais@microsoft.com>,
	Rachel Menge <rachelmenge@linux.microsoft.com>,
	Hardik Garg <hargar@linux.microsoft.com>,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	Gillian Laming <glaming@microsoft.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] smb: client: fix cached-dir and deferred-close unmount races
Date: Wed, 18 Nov 2026 00:25:27 +0000
Message-ID: <20261118002529.250616-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
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

While investigating the cifs_kill_sb() unmount busy-dentry race fixed in
"smb: client: fix busy dentry and inode on unmount from late oplock
break" [1], I wrote a static analysis tool with AI assistance to scan
for the same teardown pattern where objects are moved off shared lists
and locks are dropped before their underlying dentry references are
released.

That scan identified two more unmount races in cifs_kill_sb(), both of
which I reproduced in QEMU where cifs_kill_sb() reaches
generic_shutdown_super() while dentries are still in use:

- Patch 1 walks cfids->dying under cfids->cfid_list_lock in
  close_all_cached_dirs() and holds cifs_sb->outstanding_rreq across
  dput(dentry) in smb2_close_cached_fid() so dentries for dying or
  concurrently closed cached directories are dropped before
  kill_anon_super() runs.
- Patch 2 counts cancelled deferred-close handles in
  cifs_sb->outstanding_rreq while they sit on a local stack list before
  _cifsFileInfo_put() completes in cifs_close_deferred_file(),
  cifs_close_all_deferred_files(), and
  cifs_close_deferred_file_under_dentry().

[1] https://lore.kernel.org/all/20261117001733.192399-1-sidchintamaneni@gmail.com/

Siddharth Chintamaneni (2):
  smb: client: drop dentries for dying cached dirs during unmount
  smb: client: fix busy dentry on unmount from cancelled deferred close

 fs/smb/client/cached_dir.c | 31 +++++++++++++++++++++++++++++--
 fs/smb/client/misc.c       | 32 +++++++++++++++++++++++++++++---
 2 files changed, 58 insertions(+), 5 deletions(-)

-- 
2.43.0

