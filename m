Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196475;
	b=yF4DOjj5Z1yvP68EuPZn8uaSLyszESHHXVzZRIbwOWOh8UDMcytRU38RXY2YyJBxQHJV
	 cZLukO1/9+S4HXoqmNPgOwboXo0KsT08cl3GhI2HghmAn2IunXWPEltmRzCNdlQRK5/Ai
	 AMiKmV5nfJEBslvpeKtfXWWmBBt/A/Bd46M7wlddFji8W15Vmoq5EdKYj7Y3WvCri6kfB
	 0t3w3HVm9wQhkGlyX147Ff7gvWqFr1Ym+3xmzBTF4Y+599rDw80+1ltY125kjC+164AFW
	 elbc302yfe0UINf3UfEj1+ye2YSvkPrQGphPo7CLWHjA9jtBt2y5JiJEHtuw3mV2nnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196475;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=Yttu17P/aZtjQ1zeZnm1P4mYe97rcjK2QdjYEIu3Qmc=;
	b=Z7gqsbZNavMZzZzc+D3Wxa02XqlbuiHp+psVzpoEuL1SYIMf7nt5YFitoY0SG0NhoVHK
	 NR/nFStbcAWSI35LdwmSGJt1NPDLMDxuhSR3pfhNjczYOTbEL70ssun+S5NbhsHZwAIA/
	 ug3DqfjkCannWEutfdXIQeifK9rv8GI7NSWINecazvQx1asPtNvIpn1XQ5dJMWp16R8JQ
	 bra92rdnVLz1whn3CnJKYNXvZ+yIgSlRxTDY78hQi57iUEMo+v/88l/xB2Y2TUFQaQbcs
	 7kiLQh8RtjJXBU+LNIeFxwJuwLjxghBBdtpcaNqOgioo9kQ4JRAEFabD9EEDx804BhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mm1oDWL5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5823A606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mm1oDWL5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B14B1F000F0;
	Fri, 20 Nov 2026 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196475;
	bh=Yttu17P/aZtjQ1zeZnm1P4mYe97rcjK2QdjYEIu3Qmc=;
	h=Date:From:To:Cc:Subject:References;
	b=mm1oDWL5+54g7usZiCMAAx4zRnEeI1lPVa2Qu0xxTXJcnduoE1jfrqerO+Qzk3ghl
	 SL+zy3YOgOpc8Y2xqfLwtCbyUzu2nh2/ZcjaIbLyecheMgJRTcw6LNEEX7jXuKbBFG
	 6iGI0699pG4dYEpFUHz1ZBaqnFe7BCixf8L8mynmJqDd2O31yV2oUOiJ/A7lJATjPK
	 3pqPrnMNwqlEAsN4jJpzII4cTVw+g9nCHksRo6XWzJfQhVyAEW9VssxAoTZL1Akafd
	 kNupyHUKQ4frXqczKhbZ08Sov/o2TYsqwjhOzuZas1D9VX90sUPCyiVQO7TVQFWvoM
	 o9UyY89NazNyA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xUSbq-00000004aFK-2CWJ;
	Fri, 20 Nov 2026 12:41:14 -0500
Message-ID: <20261120174114.323473747@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 20 Nov 2026 12:38:54 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jaewon Jung <jaewon8868@gmail.com>
Subject: [for-linus][PATCH 02/32] tracing: Keep copying markers when one instance is stopped
References: <20261120173852.687189370@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Jaewon Jung <jaewon8868@gmail.com>

When several instances enable copy_trace_marker, stopping one instance
can prevent the remaining buffers from receiving markers.

Continue copying text and raw markers even if one copy fails. Return the
largest successful write length, or -ENODEV if no write succeeds.

Link: https://patch.msgid.link/20261104232046.32519-1-jaewon8868@gmail.com
Fixes: 7b382efd5e8a ("tracing: Allow the top level trace_marker to write into another instances")
Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 4ccdefb5c3ef..527b16690acb 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6345,9 +6345,10 @@ tracing_mark_write(struct file *filp, const char __user *ubuf,
 	if (tr == &global_trace) {
 		guard(rcu)();
 		list_for_each_entry_rcu(tr, &marker_copies, marker_list) {
-			written = write_marker_to_buffer(tr, buf, cnt, ip);
-			if (written < 0)
-				break;
+			ssize_t w = write_marker_to_buffer(tr, buf, cnt, ip);
+
+			if (w >= 0 && w > written)
+				written = w;
 		}
 	} else {
 		written = write_marker_to_buffer(tr, buf, cnt, ip);
@@ -6424,9 +6425,10 @@ tracing_mark_raw_write(struct file *filp, const char __user *ubuf,
 	if (tr == &global_trace) {
 		guard(rcu)();
 		list_for_each_entry_rcu(tr, &marker_copies, marker_list) {
-			written = write_raw_marker_to_buffer(tr, buf, cnt);
-			if (written < 0)
-				break;
+			ssize_t w = write_raw_marker_to_buffer(tr, buf, cnt);
+
+			if (w >= 0 && w > written)
+				written = w;
 		}
 	} else {
 		written = write_raw_marker_to_buffer(tr, buf, cnt);
-- 
2.53.0
