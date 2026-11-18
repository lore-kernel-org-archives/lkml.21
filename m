Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.77.101.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013495;
	b=pejw0wEtswLLqkSu8mfvVqPuZDb110azKxWr0ftSQAgCJitMHlfrNCqoKGaqCdrn5EsC
	 r12BLIW2aauSKG3OHoFZ2MA/cRiiGa5mjxzedxpoNSK71a+4SKZtM6fksklWaiPqtj7Nt
	 hYdIuuqmNJVrteopCbocHouuKd/iiEbLlUG1pL8GvDJJbbF5Uc16aTjXFFgsRvuApqaA9
	 6jf/JslnaPuKF1ZL7PYlqrqPe9vLxMdq3KXPSjIMkFxyUuoq6GVEO84+tR67Hwli25VUE
	 bIf+c+YFk9vTOBABKzM3pHkQqCp8rk2whnBIlQfjVAFPauigUXezdyuMNIkCUuUGHIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013495;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-WP-MailID:X-WP-AV:X-WP-SPAM;
	bh=4RxBtY9vxc+Kp6wVwu6gxnSGPF/eTmawoe5vFTJzFaQ=;
	b=QIT5LbcUSYlMgZFezAxelJenhVnartbZxjpX8iytTJsLCBshm6oT8MJ4RvfZnV6uuEh5
	 YHQMHVbd2FoQLFGJQu0I5oSaxTnSpm2+t2n9IE9hEjmj3+jbjYLyDgx+ifvTzXDm289aD
	 9DvNwGqqa1Y+OHW1Df9OTpddiCViUZetJ7+smiw7ids3QuxcUkdt1drF5sJMGEePVxP0X
	 DoXzyHvDUJH8tym8lYz/O7NQOtQzFX/IZzQ/oD9rf59UaS3Vzne3fN6QTbH4/gdaqwCig
	 /yuGGoqr3trLTeHcEWW+j3KO/ZQuLIXH3q5eENRjhLWfBusVhnsSN6CaAa/W6ZqyAlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wp.pl;
	spf=pass smtp.mailfrom=wp.pl;
	dkim=pass header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=V152Dstj;
	arc=none smtp.remote-ip=212.77.101.11
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD54606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DD54606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=V152Dstj
Received: (wp-smtpd smtp.wp.pl 21108 invoked from network); 18 Nov 2026 15:51:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=s20261001;
          t=1795013485; bh=4RxBtY9vxc+Kp6wVwu6gxnSGPF/eTmawoe5vFTJzFaQ=;
          h=From:To:Cc:Subject;
          b=V152DstjlIjXzLnu8NjZyYwreeWqWXoXKShNNSeIv3bo67RwR+wEVyqN4g9YsFjFI
           xOmptL4yTOchd1zAlsCZR5W+LyTQf6U65AKe2Ww47a6mQTgWXtAew+s42fK1qnKo7A
           0Ztcn/8a00QwX2omBLvASgTLVrr4rhA36zEExBxXyGpigEmXrSC7NcPzc24EeIGRvb
           9Jen104NvxdwGozEgTC0ATVLys69IPg53+uhuDb18aP8EGJtgi6fBrMhS/RItLECac
           f/JoCv5FsdZaU/JA2zqrsq3gA6Jjzyd9A8PMdpRV8YB8aNR4z60wKnxRbGGydOd74M
           moEIyAmrEqtmA==
Received: from localhost (77-236-5-223.static.play.pl [77.236.5.223])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <linux-modules@vger.kernel.org>; 18 Nov 2026 15:51:25 +0100
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: linux-modules@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jordan Rome <linux@jordanrome.com>,
	Viktor Malik <vmalik@redhat.com>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v3 0/3] module/kallsyms: sort function symbols and use binary search
Date: Wed, 18 Nov 2026 15:51:22 +0100
Message-ID: <20261118145125.29399-1-stf_xl@wp.pl>
X-Mailer: git-send-email 2.52.0
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
X-WP-MailID: 113bda48f6e52cef21e1ab72afaf099d
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000B [0RNE]                               

This series enables binary search over a separate index of core text
symbols, preserving symbol-table order and supporting livepatch modules.

v3:
 - preserve core symtab order by sorting a separate index array
 - index core text symbols rather than only function symbols
 - enable indexed text lookup for livepatch modules
 - rebase and update commit messages and subjects
 - sort equal-address by descending symbol index so binary search
   selects the same alias as linear search

v2: https://lore.kernel.org/linux-modules/20260327110005.16499-1-stf_xl@wp.pl/
 - fix searching data symbols for CONFIG_KALLSYMS_ALL
 - use kallsyms_symbol_value() in elf_sym_cmp()

v1: https://lore.kernel.org/linux-modules/20260317110423.45481-1-stf_xl@wp.pl/

Stanislaw Gruszka (3):
  module/kallsyms: include empty names in is_ignored_kernel_symbol()
  module/kallsyms: sort text symbol indices and use binary search
  module/kallsyms: enable indexed text lookup for livepatch modules

 include/linux/module.h        |   2 +
 include/linux/module_symbol.h |   6 +-
 kernel/module/internal.h      |   2 +
 kernel/module/kallsyms.c      | 202 +++++++++++++++++++++++++---------
 scripts/mod/modpost.h         |   2 +-
 5 files changed, 161 insertions(+), 53 deletions(-)

-- 
2.52.0

