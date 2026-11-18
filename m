Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.150.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962246;
	b=iyAoHcGqujps2vbuEHXGuvu4v4uoex8ZDRd5jmo2dTbW2RIefNZPq5yQ3Fr3PIOfMi4V
	 Z5mCIULe0jJv7hEre7AvdjNu0JRaFZIP7+NOWTL/qzscd7iGNz9zbO8jxeD95zjzi99bJ
	 9Fa3A7kVCtnmc3wKhObpaCMkrzR3jBy6wfS14oYtrei+TQtW5DRSMSrDLoLtKZKZdyGYp
	 b7rByVg8Ch4E1DQnXq+90MD5IU6ndCDEk0LLezaBDFi/zPgtGeK0sXF1piRWfjZYiIRyK
	 SLCvmbjAzzy3Tq2rg29GDY7ZdK14PPYlsiY1L0S8DykJSylB6FvxR1g1w9VcIZBJ3fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962246;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Orig-IP:X-Proofpoint-Spam-Details;
	bh=BmH2HJBNU7g56YAYVpbKo3jnFN4guXcX8zC5qVeFtW8=;
	b=epUzwAftVgwNwN9JjR9Qi3+JLstxpJdnwf7ofweRfQft/3YJ36/DifZxxcsL4jsY2u/y
	 DDlQn05mN443Wh98Vbn1qUZ6PWukG9FfKvVvSTqISehZ+O/Rd/9KRpTv90qO6EkZrqueG
	 YdipUvZywUWn2ZFT1hGzNrvTha56BR22uMNRPn46h2E4dxxBvgx/20Q0ndm2eTYd04djL
	 fyqw68IFOzic7eC5/FOK8KmGF+Wx7UxwDgJ5t2Bap/KZo2NVVFz0uO2TKLQm753zHkXln
	 1AxjERh5B64nMZs6yYk948p9hyLZh964N1rCCSngCox/UCV0xWFwZMux5Ww4Dt8bXZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nyu.edu;
	spf=pass smtp.mailfrom=nyu.edu;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=e13sx5Uo;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=UjE3mKJ2;
	arc=none smtp.remote-ip=148.163.150.240
Received: from mx0a-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747DF606A883
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 747DF606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=e13sx5Uo;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=UjE3mKJ2
Received: from pps.filterd (m0355795.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMY5ux2070044
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=20180315; bh=BmH2HJBNU7g56YAYVpbKo3jnFN4guXcX8zC5
	qVeFtW8=; b=e13sx5UoG1M+/4I/Kpj1YUj79oDw7obH6vaHjTYyK3KmH82/XEJY
	gg/bedyw3LVVo13zGNQfSmtSj5M9+ZoDnNJAuqaK/eQUr9AYRLq18QLe1jtV16Xb
	1gCm7QXQry3nQaN9mvJyY/QibdEZI4MdNCorzd0ayi4Voj85rIlMQiLOfdzMgw2X
	rYHHbziKuLoCouPnajw6E1DHeYrMzDszhygp4w2rIbEXaz4g+893GsY/zLEEj85m
	uXR3nzsbs7oYVM6LV+JXCmbLYWSZtDS3MmP0iS77V3F4vBsV7rsYgBFYyK71NkES
	j4g9gXDLvd4h1ZYZvfgGU59S5XRpEshReQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4j0yu6sgqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:37:18 -0500 (EST)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so62846785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1794962237; x=1795567037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BmH2HJBNU7g56YAYVpbKo3jnFN4guXcX8zC5qVeFtW8=;
        b=UjE3mKJ2KHDLQgcUEQPAtKB8x2CYc26FXgPieugBwPcEHKwyr20qbxc8CPaQOWOzuQ
         4vZNcIJZSVJoc8btUD2OvCKyPR/Hl4MG/ENrEAB+3y5RnMgVupm/J9J6ikoGoK7IlCUL
         zULIOnoUpWPIXCFnY7rK0B48d/Un8DfQoCi3cALZ/UzBNeS9x2AeOyf5hIRoKKB7Osjn
         nLtL4QVoXSLypPtV8l+PgDVtYh4oTtD6JtcDTI/8dM1iALxLa1vK6D5Nhw+4Gm5i0zNy
         z9LnR/FIucETI9ojKvRuA16c7hpxHZohHk5kPXvbbv3ISO/uASZQ+Qubox+yBdddnqJh
         E1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962237; x=1795567037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmH2HJBNU7g56YAYVpbKo3jnFN4guXcX8zC5qVeFtW8=;
        b=UmOWGOZqw84W0+bKFx42lJN3nA6t+o2PveFJ6BdUEhT+1yEUbltEXuVFpP749Nmema
         FiYljQ/hNw/8Tk33HAtcfs/ayqOj2cxwCBWK3kukzVK2LHET3Pk3x2OQOdfoRcWm0bHs
         mSpU1hHkzUTLT/OISFcXloruJkPc6ic2M/yCBbMaCYKnds2Absai1SutGPHLhJh189jR
         3VKHWGkJKXewMNTVJcXOqtQVZBy2EN1RfNtwC8bqFhCrz6X6fzPFMFBJA4gZOqgDdSn+
         TgC8f0R/dsyEMS9046p06rdM9gKa/cXJm5b3uMxtEtbHKz1ZSa5cYlOps5bJjTTmd7eY
         VDVQ==
X-Forwarded-Encrypted: i=1; AL+hErEQGWnhzXHnkCBh8F0T4mClgHufiFQjia0WJRev8aqUIWbikPObSRzik629ysqa1dyZYpVR37IVe+PxHrQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AE07BojLdqzNQTeIj90YHo1LLNWjxr6DUrfCH6yp0qmzIV4Oz
	j/vJQPrIhLLUMJNFW+cucS/n3sheh1XyhZl6nKniDLx0Ev6f+pD2RhmAC++ZhC38OSfJvEo1jFF
	+AUEjMlnY7lMgS9eecVtH80Aze1o2vsDINsSt6eiShrTBXLHbqKfxH2wyg0lwwVk=
X-Gm-Gg: AYBFou0cX10Dv8wtBp2zDJSXOLguwRBTCjO1BGdV7Hlg/2A5xIqxmTQu3dK5KTtDv4A
	WggcxJyKCrsYJ6b7JuM3dpUG47io4aP6tqNr5yvtb80d4xy683XzUwmpYruZGz5j0SuCWVhNILc
	LytLwL8NliepvnvXNe4jGllhLWYajucNYDoV10H0U6kwQaGzWNefLUqBP1TIMm66eQ1C5fJ+ijp
	74qKFG7cP4rTtixFLfDtOUgU0SskxC5iEq28bga0LI9vdfbt93sCS9uXlyN3OxKsRgQBQ8xYohW
	kPw9wCly7ircYn4+ihxrIndauM0z5Zzw3+S2R57uh09vIwfYRXuXyO7CGERZx8rcqPOKP+IP+kS
	PJ3dLd2d/Zl1vrKpMo9VOHJSOBVWuyEu1Z77E98NYpROYZS4OEUgogEoh34PDMulzZPONQgAGJM
	Q4gF5U+AQohw==
X-Received: by 2002:a05:620a:700e:b0:949:698f:8be8 with SMTP id af79cd13be357-94999648996mr248098685a.64.1794962237293;
        Tue, 17 Nov 2026 16:37:17 -0800 (PST)
X-Received: by 2002:a05:620a:700e:b0:949:698f:8be8 with SMTP id af79cd13be357-94999648996mr248094985a.64.1794962236622;
        Tue, 17 Nov 2026 16:37:16 -0800 (PST)
Received: from jerrythepro.nyu.edu (216-165-95-155.natpool.nyu.edu. [216.165.95.155])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7475b8sm51691785a.18.2026.11.17.16.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:37:16 -0800 (PST)
From: Kaho Jiang <kj2864@nyu.edu>
To: idryomov@gmail.com, amarkuze@redhat.com, slava@dubeyko.com
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        co+a9f1a2fc804a2921@bugs.sh, Kaho Jiang <kj2864@nyu.edu>,
        stable@vger.kernel.org
Subject: [PATCH v1] libceph: replace undersized receive middle buffers
Date: Tue, 17 Nov 2026 19:36:42 -0500
Message-ID: <20261118003641.1069010-2-kj2864@nyu.edu>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAwMSBTYWx0ZWRfXxBTO6zLkSzTk
 ksMyIAIM14wGRqyYkq4PC477HKDo14kELMvSxeMZv/BHUenJS8w/9RK0gw+suyJZGVLLtkfU7hX
 TCAdVyfXDYbXXDXMFkbluZMndi0twOA=
X-Authority-Analysis: v=2.4 cv=IOCXmQvG c=1 sm=1 tr=0 ts=6afcf33e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=DJxkqqoNvFVJFTNdoq0VCA==:17
 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Se5WoFf3ZZRiLcel0nel:22 a=Lu3rmdZLeA08KL8VqJdF:22
 a=VwQbUJbxAAAA:8 a=6fTL0N-4C1eZiWn3T4sA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAwMSBTYWx0ZWRfX5HkFb5zj080T
 DqkpoCAK7+/Cjvs98WzNJTf4w87SeKBjJzHavTttjYBQkbjZQvTy5J8aBMbp5KGGoi7wqBqdQGc
 H1Fx7dVBqFr44rvSXIUeWtttGlWaH9tiz1YyYyIB0DWVGLxJQL2zfhq4V/crrgY4FYBExBqwYXe
 xb0Zewedb8Kb2l1A6uPZlwp1qy6aKycTQM8Mw9bFg/ubmfw0RA0QUIS/4hsVzzJUoXrT9vyHmbZ
 JO1w+AsD3b1xI5lZzAZfrd99hgcZg4fdiK/lh9Bnxzj11aVD54dTa3lwgPdJDbTPAIU33S09RkD
 npJWzGEIQkJObqbo5fzqrPqs+ONJ5NUko6lXyTM+d6ExHr/k91JilU27Ra8DxVHOW4QXnAvnrl6
 M3mMwKec2upkF0ope35vIJQOmWG0Qn/U58sxQVNmKLbhKCoEFNsd3w1MdkvSVFV3dW+QqVQvUS0
 4YCggSapFEDse9o6z+Q==
X-Proofpoint-ORIG-GUID: 4p2p2AyIZRWgyPX_ui0UNqI7t5CV_inR
X-Proofpoint-GUID: 4p2p2AyIZRWgyPX_ui0UNqI7t5CV_inR
X-Orig-IP: 209.85.222.197
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180001

ceph_con_in_msg_alloc() can reuse a message whose middle buffer is too
small for the incoming middle length. The receive path copies that
many bytes into the buffer, causing a slab out-of-bounds write.

BUG: KASAN: slab-out-of-bounds in _copy_to_iter (lib/iov_iter.c:77 ./include/linux/iov_iter.h:86 ./include/linux/iov_iter.h:308 ./include/linux/iov_iter.h:332 lib/iov_iter.c:197)
Write of size 4096 at addr ffff888023765000 by task kworker/1:3/4983
CPU: 1 UID: 0 PID: 4983 Comm: kworker/1:3 Not tainted 7.4.0-rc3-g666539eecdf4 #1 PREEMPT(full)
Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: ceph-msgr ceph_con_workfn
Call Trace:
 <TASK>
 dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
 print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
 kasan_check_range (mm/kasan/generic.c:186 mm/kasan/generic.c:200)
 __asan_memcpy (mm/kasan/shadow.c:106 (discriminator 1))
 _copy_to_iter (lib/iov_iter.c:77 ./include/linux/iov_iter.h:86 ./include/linux/iov_iter.h:308 ./include/linux/iov_iter.h:332 lib/iov_iter.c:197)
 simple_copy_to_iter (./include/linux/uio.h:228 net/core/datagram.c:521)
 __skb_datagram_iter (net/core/datagram.c:435 (discriminator 1))
 skb_copy_datagram_iter (net/core/datagram.c:535)
 tcp_recvmsg_locked (./include/linux/skbuff.h:4268 net/ipv4/tcp.c:2851)
 tcp_recvmsg (net/ipv4/tcp.c:2955)
 inet_recvmsg (net/ipv4/af_inet.c:894 (discriminator 1))
 sock_recvmsg (net/socket.c:1154 (discriminator 1) net/socket.c:1176 (discriminator 1))
 ceph_tcp_recvmsg (net/ceph/messenger_v1.c:34)
 read_partial_message_chunk (net/ceph/messenger_v1.c:975 net/ceph/messenger_v1.c:964)
 ceph_con_v1_try_read (net/ceph/messenger_v1.c:992 net/ceph/messenger_v1.c:1245 net/ceph/messenger_v1.c:1417)
 ceph_con_workfn (net/ceph/messenger.c:1576)
 process_one_work (kernel/workqueue.c:3495)
 worker_thread (kernel/workqueue.c:3578 kernel/workqueue.c:3659)
 kthread (kernel/kthread.c:436)
 ret_from_fork (arch/x86/kernel/process.c:158)
 ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
 </TASK>
Kernel Offset: disabled

Release the existing buffer if its capacity is smaller than the
incoming middle length, then allocate a new buffer through the
existing allocation path.

Fixes: bb257664f748 ("ceph: simplify ceph_msg_new")
Cc: stable@vger.kernel.org
Reported-by: co+a9f1a2fc804a2921@bugs.sh
Assisted-by: LLM
Signed-off-by: Kaho Jiang <kj2864@nyu.edu>
---
 net/ceph/messenger.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/ceph/messenger.c b/net/ceph/messenger.c
index 212e7797f9e4..ccb650708663 100644
--- a/net/ceph/messenger.c
+++ b/net/ceph/messenger.c
@@ -2098,6 +2098,10 @@ int ceph_con_in_msg_alloc(struct ceph_connection *con,
 	}
 	memcpy(&con->in_msg->hdr, hdr, sizeof(*hdr));
 
+	if (con->in_msg->middle && middle_len > con->in_msg->middle->alloc_len) {
+		ceph_buffer_put(con->in_msg->middle);
+		con->in_msg->middle = NULL;
+	}
 	if (middle_len && !con->in_msg->middle) {
 		ret = ceph_alloc_middle(con, con->in_msg);
 		if (ret < 0) {
-- 
2.43.0

