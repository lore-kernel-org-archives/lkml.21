Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795817660;
	b=PshrRB492FmQjIpNs23EvL3edQmBgQnfHE7cThI1+eyfdNgXUilGud+rTlltWdyS5nrH
	 828IMo5if06EStqZ7as1HKcgUeiwatYIFUyh9nxKOOVm8oeiiLFGhCX3YK68zFMu0BAci
	 Y+B69rPTT0jkoUgZDLd2Skzs5BzwWBja5MqxyRDgf+jtHAcRHAm5ksIIWKRzlphrEYvXE
	 IIK4jRtneig9ozDadG6bJyqS6Nlw45RpBXO5bf/oms9Rzc5RHCXjWVVMlouRknbwwBuVW
	 xBmyFvRLiaIcEpDGrmITN5/4KvfiVgTJdTEjS95an4GqZMP/nE66jUs+YMRJQrZ4GEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817660;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Stat-Signature:X-Spam-Status:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Session-Marker:X-Session-ID:DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=xmysb+AOKmWyHHQL9HFlpt3Fzy5PjzXsyT5qvr4KqCc=;
	b=zl4j8xH2VXwwwZiQdH/tV7ogZRPiH1+okEl5KzTPzTZOEC+WAsuoiJWDt3DcOEdtI7sW
	 L0gO6Crpi2NkcjuoqAhRdoPA/EdeccLEmwglRgtm66g+WmB2P1AKjPNFujsRbkPWaeas6
	 5pbnKVmZdt5W7eNInSlhu8rhFcCtwHVEmKWYxl1ho3/pQLJbmpmRUK54lVJKk/UTpMLlm
	 N8p8ubO86o5xwDinZ6iQc1Ul9f90Sd+nGWhqxt1sBRRLXXJa96EY6Gn0xs3vPEBWsq0cO
	 CzHWdpsWqkRhIIDSOWwiNNyYXl1v7KRZLAIkoPw9x/CF8FquxoOXLmHSuit04JVnrfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=GeZQpEct;
	arc=none smtp.remote-ip=216.40.44.13
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4B2606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C4B2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=GeZQpEct
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id A8DC640520;
	Fri, 27 Nov 2026 22:14:11 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id EB77718;
	Fri, 27 Nov 2026 22:14:09 +0000 (UTC)
Date: Fri, 27 Nov 2026 17:14:08 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH] ring-buffer: Add missing cnt increment for
 remote ring buffers
Message-ID: <20261127171408.0d804b05@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: huz387r9jrbwrqeu9m1twi1ydn4korzu
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: EB77718
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/zWkQtEHBwjiM+vgvrxhKcd7DqvCWHWgU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=xmysb+AOKmWyHHQL9HFlpt3Fzy5PjzXsyT5qvr4KqCc=; b=GeZQpEcttKyAnm7pPtJTbjGIapF3BqHDrvqyWi4crgfnhYp1TRy9+M4Mj5IrKJHtERzCoRn8KYh3hUc51H1hcgrt6evytlmxuXIr/jPR3x/NOfwdHn7oqrPlTmeoXmkUvq5NiFNkJlWYxbrAQVCshvatDO0ynKdJK3PauB3ZBkc=
X-HE-Tag: 1795817649-987414
X-HE-Meta: U2FsdGVkX19alCtx/1lhqeAN/c6HHvZlpQffh6C9DgyK2suzPm1O6EHkSfFXCnKllL0PMp8lUzbK5C211R4qnZYFTE5u5D7WKddZFHAgdroa/M3gvCVgjHXuSBe9k6NvwJppddBYn5xxK6KffybgtWqjVGwc4RnAIzpL2ZpxlX+MmkdQYxTkX9o9Ox6iyT68Ko09JXq0zxHOMi5sryTxeIYP83Bz3IANC2M21LwmuIt/vU0PuxweXUKuaDgzZEFsuhifpuczF2hDn/O4o2C2obgFy0VnBgr/PLJzM5UjnuoBFmExaE3P9WOhTRxDOvm6Fr+P4BsXtB8wNHy7ODPsz06+XMy3RHSdAnefW1ys9vFZsPHN7UvlTl9Tp3h5aemF2sm1cqYKfofpiQ2OzpqQ8wKnQ/7Ard/9OwiUViPAP6MIQ0w4O4Ahdyo40QskNXhuS0QY+9D/R2pIVuJDCk2UC+hO29hcmw0XLogZRW34lZO5OYUKcijFWO1OpXI4dSEl


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: 76a0a6d58318fff8b14530ed9b99c7065995db29


Vincent Donnefort (1):
      ring-buffer: Add missing cnt increment for remote ring buffers

----
 kernel/trace/ring_buffer.c | 1 +
 1 file changed, 1 insertion(+)
---------------------------
commit 76a0a6d58318fff8b14530ed9b99c7065995db29
Author: Vincent Donnefort <vdonnefort@google.com>
Date:   Tue Nov 17 15:15:20 2026 +0000

    ring-buffer: Add missing cnt increment for remote ring buffers
    
    The ring_buffer_per_cpu::cnt member tracks modifications to the ring
    buffer links. It was introduced for rb_check_pages() to avoid locking
    the ring buffer for the entire duration of the check. The reader page
    swap function for remote ring buffers does not update it. If a
    concurrent rb_check_pages() recorded a page as head before dropping the
    reader lock, it misses the list update and loops indefinitely. Add the
    missing increment.
    
    Cc: stable@vger.kernel.org
    Fixes: fbd1743ecba1 ("ring-buffer: Add non-consuming read for ring-buffer remotes")
    Reported-by: Sashiko <sashiko-bot@kernel.org>
    Link: https://patch.msgid.link/20261117151520.3972146-1-vdonnefort@google.com
    Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
    [ rebased to v7.4-rc4 as there were conflicts ]
    Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index a5a0adc934fa..65dddfac5e04 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5891,6 +5891,7 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 	cpu_buffer->pages = &new_head->list;
 	cpu_buffer->lost_events = cpu_buffer->meta_page->reader.lost_events;
 	local_inc(&cpu_buffer->pages_read);
+	cpu_buffer->cnt++;
 
 	if (!rb_page_size(cpu_buffer->reader_page))
 		return NULL;
