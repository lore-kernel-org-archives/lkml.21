Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368845;
	b=qUWhiTTQdI7Xu2/pVqAZOTEvOgj4Q0pmrKXWR7OzEIvZlCJmKsKR1mIHVTqNgLY+HQHW
	 Wjg6WN7YA6QhI8KdPus72QZvmJ5tzrV9v6Mw9756mE3Qj06rhVLoPcXJW9WCRpPyt5WcE
	 SKVxLzD4LoF68/VR8+yGTO0ZvzY5AqSE8rENES3LIppFjntLsmw0ZJn5YRpHU/l2S0slQ
	 6J8aaadormMu4lcCjUPSfyWPq6zveMEJ1xK2WKT77X6eCPkYUKWYHE8x7fYVpB+5AjoPb
	 kfd6hHMcq8D1CiaZNlW/XhYrD6TH/MmCUIy9D/W1cxV+AxCKKkXvpZZHSzLYJjVFAMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368845;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=XRMu6c/q4DDc2TZ7MmRIaOeTNkt4vLYxjxQz26tk6vo=;
	b=FjvOCs7seZKBRBdQEdwNRRceYxXZ5/yYZ/a7T9/J5WTileJGEjpPv3oAotewazTkrA1t
	 gzDDCMGIxwAQjAZsOmN5PSnUlak3F8RGk2V3GjKwtN4Wb3I0kemEyEj/mh4WKxERm45pu
	 S+d9WO022y7C0359YyFVcxRjN6PP7ZTqjyU8jw6AL+TmGHtQT6cxmN7JHgCMmK7zzzWyf
	 eyl0yeZrzEe5C4+Z2QeISoEvLvelnVxGAPdp3ArWf8y95yyBV02WqQKx37o0ALzbloexr
	 neWqjqfl7BXWqkqh0AbUsPRjWcA3snCCW+Q+bkOODbAv4HxDCwEaF3YT4BYePqokQgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE70606A335
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBE70606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c734afb8deso2798754b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:34:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368844; x=1795973644;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XRMu6c/q4DDc2TZ7MmRIaOeTNkt4vLYxjxQz26tk6vo=;
        b=DxMt9s+Ugc5bvbTLJOjNFoRQksI5qJ9CVlFzUILSeKlXwnOJ9iQbqQxb1y3BJPvvQd
         VMBxGsXJwu5/E4g992vytV+3et6W8SmOqnJCXyX2YK003X/CFzJW2PJoVneaAEPAjuMQ
         0MKqZ10VBwQ6T521/KLNxp2WWSgX0AB2tbbclY/pmjNwJkB4yHMP/0vBgqw2U5gQ5U6e
         Ruyaci6MW8XBL4iyLfWB+D+6m9WMcg2QyJl8UxY7kLdMRudG/ahh3Ga9o1Jxt6Uc2XCu
         n/0CnTivwbesWZuIwdqR9CWRCgDPGZNrXabTjvtHylFxEAON0cFcCJ7uceIVgsXG5u+2
         EVQg==
X-Forwarded-Encrypted: i=1; AL+hErHsIQS51cJqhwIFXhh1hXmOhjU8Z9xKyVGrGA5y99e1k4r8Rt5KT6/btnIl5gAw0DwdXT/fE4ag7qNYcuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QQXLFK3nsX+ULIQbWaiat4u+3DFvbwc22YbJIO/pkzWMhqcoZ
	JrBh43cwytivxRMsCKAy+fQEr0Ju1wSs7cztunaGJ8k6GFSlC1+wx3nOdgsXNpoxt4UkJLsoskh
	+yhNO6WHrkmoakWCp6YX+WG3R3ozr6ysTlVPK9n6Xzd27rxsaWRQNSrnMw+4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:508f:b0:4c4:c7cc:f8ee with SMTP id
 5614622812f47-57a0a20af5fmr11375830b6e.13.1795368843894; Sun, 22 Nov 2026
 09:34:03 -0800 (PST)
Date: Sun, 22 Nov 2026 09:34:03 -0800
In-Reply-To: <20261122093400.b726ecddf154f493dec1c892@linux-foundation.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b03278b.a895ff1b.3d141e.00be.GAE@google.com>
Subject: Re: [syzbot] [ocfs2?] possible deadlock in shrinker_free
From: syzbot <syzbot+38fdbb551940270021f1@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org
Cc: akpm@linux-foundation.org, heming.zhao@suse.com, jlbec@evilplan.org, 
	joseph.qi@linux.alibaba.com, linux-kernel@vger.kernel.org, mark@fasheh.com, 
	ocfs2-devel@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	zzzccc427@gmail.com
Content-Type: text/plain; charset="UTF-8"

> On Sat, 21 Nov 2026 18:47:38 -0800 syzbot <syzbot+38fdbb551940270021f1@syzkaller.appspotmail.com> wrote:
>
>> syzbot has found a reproducer for the following issue on:
>> 
>> HEAD commit:    f802b6558eb8 Merge tag 'xfs-fixes-7.4-rc4' of git://git.ke..
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> console output: https://syzkaller.appspot.com/x/log.txt?x=141d98e9580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=3cc6a7ee2d24d208
>> dashboard link: https://syzkaller.appspot.com/bug?extid=38fdbb551940270021f1
>> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10918a03580000
>> 
>> The issue was bisected by AI to:
>> 
>> commit f277230d002d03ed98b814b735f9d3d01b42020a
>> Author: Cen Zhang <zzzccc427@gmail.com>
>> Date:   Fri Oct 30 04:48:56 2026 +0000
>> 
>>     ocfs2: serialize inode journal access with shutdown
>
> #syz test

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: ocfs2: unregister the JBD2 shrinker before journal shutdown
> Date: Sat, 21 Nov 2026 19:34:56 -0800
>
> sysbot reports a lockdep cycle through shrinker_mutex, filesystem reclaim
> and osb->journal_shutdown_sem.  Unmount holds the superblock's s_umount
> exclusively, while the OCFS2 reclaim path must first get its read side
> with super_trylock_shared().  That excludes the two paths for the same
> superblock; the report does not establish a runtime deadlock.  Still, the
> lock ordering is visible to lockdep and produces the warning.
>
> The write side of journal_shutdown_sem must cover all of
> jbd2_journal_destroy(): ocfs2_clear_inode() can otherwise release a JBD2
> inode through a journal that is being destroyed.  Move only the JBD2
> shrinker unregister operation before taking the semaphore. 
> shrinker_free() waits for active shrinker users, so the journal and its
> checkpoint counter remain alive while they finish.  A successfully
> initialized JBD2 journal always has a checkpoint counter.  Destroy it
> after unregistering the shrinker, whether unregistering happened here or
> before taking the OCFS2 semaphore.  The semaphore continues to protect
> JBD2 destruction, removal of osb->journal and freeing the OCFS2 journal.
>
> The userspace-visible result is removal of this lockdep warning during
> OCFS2 unmount; the report does not demonstrate a hung unmount.
>
> Fixes: f277230d002d ("ocfs2: serialize inode journal access with shutdown")
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Reported-by: <syzbot+38fdbb551940270021f1@syzkaller.appspotmail.com>
> Closes: https://syzkaller.appspot.com/bug?extid=38fdbb551940270021f1
> Link: https://lore.kernel.org/6b0257ca.6ccd1e40.868ea.001a.GAE@google.com
> Tested-by: Andrew Morton <akpm@linux-foundation.org>
> Cc: Cen Zhang <zzzccc427@gmail.com>
> Cc: Mark Fasheh <mark@fasheh.com>
> Cc: Joel Becker <jlbec@evilplan.org>
> Cc: Joseph Qi <joseph.qi@linux.alibaba.com>
> Cc: Heming Zhao <heming.zhao@suse.com>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Cc: Jan Kara <jack@suse.cz>
> Cc: <stable@vger.kernel.org>
> ---
> Tested with CONFIG_PROVE_LOCKING=y in x86-64 QEMU guests. A omitted
> this patch; B added it alone. OCFS2 and JBD2 were built in.
>
> Syzbot's C reproducer mounted a local OCFS2 image, accessed 200 files,
> exercised reclaim and unmounted it. A reproduced the reported circular
> locking warning: shrinker_free() ran from jbd2_journal_destroy() while
> ocfs2_journal_shutdown() held journal_shutdown_sem. The unmount
> completed; this test did not show a runtime deadlock.
>
> B completed the same sequence without a warning. Three further
> mount/reclaim/unmount cycles on B also completed without warnings.
> An ext4 read/write/unmount control passed on both kernels.
>
> Both builds needed the same temporary correction for an unrelated
> mm/util.c compile error in another queued patch. The correction was
> removed after testing. The test did not force an active JBD2 shrinker
> callback to overlap unmount or exercise failed-mount cleanup.
>
>  fs/jbd2/journal.c    |   17 +++++++++++++----
>  fs/ocfs2/journal.c   |    1 +
>  include/linux/jbd2.h |    1 +
>  3 files changed, 15 insertions(+), 4 deletions(-)
>
> --- a/fs/jbd2/journal.c~ocfs2-unregister-the-jbd2-shrinker-before-journal-shutdown
> +++ a/fs/jbd2/journal.c
> @@ -75,6 +75,7 @@ EXPORT_SYMBOL(jbd2_journal_check_availab
>  EXPORT_SYMBOL(jbd2_journal_set_features);
>  EXPORT_SYMBOL(jbd2_journal_load);
>  EXPORT_SYMBOL(jbd2_journal_destroy);
> +EXPORT_SYMBOL(jbd2_journal_unregister_shrinker);
>  EXPORT_SYMBOL(jbd2_journal_abort);
>  EXPORT_SYMBOL(jbd2_journal_errno);
>  EXPORT_SYMBOL(jbd2_journal_ack_err);
> @@ -2100,6 +2101,16 @@ int jbd2_journal_load(journal_t *journal
>  	return 0;
>  }
>  
> +void jbd2_journal_unregister_shrinker(journal_t *journal)
> +{
> +	struct shrinker *shrinker = journal->j_shrinker;
> +
> +	if (!shrinker)
> +		return;
> +	journal->j_shrinker = NULL;
> +	shrinker_free(shrinker);
> +}
> +
>  /**
>   * jbd2_journal_destroy() - Release a journal_t structure.
>   * @journal: Journal to act on.
> @@ -2173,10 +2184,8 @@ int jbd2_journal_destroy(journal_t *jour
>  		brelse(journal->j_sb_buffer);
>  	}
>  
> -	if (journal->j_shrinker) {
> -		percpu_counter_destroy(&journal->j_checkpoint_jh_count);
> -		shrinker_free(journal->j_shrinker);
> -	}
> +	jbd2_journal_unregister_shrinker(journal);
> +	percpu_counter_destroy(&journal->j_checkpoint_jh_count);
>  	if (journal->j_proc_entry)
>  		jbd2_stats_proc_exit(journal);
>  	iput(journal->j_inode);
> --- a/fs/ocfs2/journal.c~ocfs2-unregister-the-jbd2-shrinker-before-journal-shutdown
> +++ a/fs/ocfs2/journal.c
> @@ -1119,6 +1119,7 @@ void ocfs2_journal_shutdown(struct ocfs2
>  	 * Exclude the final JBD2 inode cleanup in ocfs2_clear_inode() while
>  	 * the journal is destroyed and freed.
>  	 */
> +	jbd2_journal_unregister_shrinker(journal->j_journal);
>  	down_write(&osb->journal_shutdown_sem);
>  
>  	/* Shutdown the kernel journal system */
> --- a/include/linux/jbd2.h~ocfs2-unregister-the-jbd2-shrinker-before-journal-shutdown
> +++ a/include/linux/jbd2.h
> @@ -1566,6 +1566,7 @@ extern void	   jbd2_journal_clear_featur
>  		   (journal_t *, unsigned long, unsigned long, unsigned long);
>  extern int	   jbd2_journal_load       (journal_t *journal);
>  extern int	   jbd2_journal_destroy    (journal_t *);
> +extern void	   jbd2_journal_unregister_shrinker(journal_t *);
>  extern int	   jbd2_journal_recover    (journal_t *journal);
>  extern int	   jbd2_journal_wipe       (journal_t *, int);
>  extern int	   jbd2_journal_skip_recovery	(journal_t *);
> _
>
