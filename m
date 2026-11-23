Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437405;
	b=joOAMIEPMdY8Znh1s9AqwAShqQYyjwvUg0co0uFgcxC9PYFfnT340nUw8ZVTxzvPgNZj
	 bNSeJF16EcFaIOpl+5hPGLuttAGSpQ7DZiyMqRSnGZTyDWVd6rIEQOX+VhcqqYi/Mvd+1
	 hcgqHMjxGMVuRdJx3/xv0iv2WeXuf2dfrZxgSrKK+MvtZCjN7rnCKIhJsZRsu3xikb/r0
	 eO8LW3OOhtlO3TV07jvIwSoGYvMjVGUpyo9mxeEJvSPV4qyuGYXSxG9szxzzQxHEXTirI
	 0xkR1myUkXUOcgN4OWZj+wlo3xDSci+oCK3a0KHbmfsW3O584I3ijqrw8zmVJwIRnwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=nTpF2pwZDOpG1HOobitpj0pCNTVMR7ybRW6PhOQZM7I=;
	b=xi1krJxM5JzIEN4tIzuuvqa7XT/S7HAIOFkVSl35X+EKEJyaDV7fpsIQPYE+2nonuXFO
	 2JEGdWSru/0qe99N196HRrl3K+CAdcyjTGxz05FliIQOK6J7HapgCIxMLskdAVgibAMFJ
	 jbp3Cc83D7qJfwz/qtDC52TPVYthXbXMENatOXKCNTmAfqGJLh36HDclA6vO8SNIUP1+q
	 cqw+UqJTrC7Oa0BJc4O9ctzcPtJU6D0l5MuTb1fDy/tkHZW/jqlLYILYSv65K+HsweDTr
	 u1V3CuUVLrq4NMDU7d+ZYFaL9nG0zl9AaO4ci3v6r7qBFbcW5EQ6arnXpztoqz+1/QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KABHXdtq;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC5F606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC5F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KABHXdtq
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4efdc8c20so18436697b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437404; x=1796042204; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nTpF2pwZDOpG1HOobitpj0pCNTVMR7ybRW6PhOQZM7I=;
        b=KABHXdtq87A4INr3N1czsoLYrtxg8YpNUdvQJnTlE8f9fsOzD06V5UbJxhVfSAk2KV
         o1+VuguvHw8rhxjK5YaBocryyHQhnBPsDPnA+gRBbSSkSYabgFubEI2bW4M2K2RLLJe0
         5CRRFEj2qzavTtqy0GGY0fYcTPrlKlkfdSo0e17zhLF30320OQyM7nlr5DkpSjlHTB1W
         pWS/95/g66AExEmLpk9IGGYBzCllKYohUPizlx2NP7nam1oJaoZq3BDjINnXWAcGeAgv
         D43sva55hFZf8XH+M/1Fnl8ZXLxN5x2l1Dm10UQrTxpCs74uBnzW9uK9yaZ8j9FMYc91
         3wTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437404; x=1796042204;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nTpF2pwZDOpG1HOobitpj0pCNTVMR7ybRW6PhOQZM7I=;
        b=V1V56zc5T7mSRwTroCjNv12DJu/VCJhM3dGJGVZ62wJwpBbGO3wQaQKVrlVBg8kInA
         5qV+rFEuGLHBBCnnXqoNnn7cxkUntRcAP8eDnhUJ0r0mmtOQZsHEWYXL9L1HjiN6BJFk
         aYIXmn4+cxm9iWjnQq/1awSSbbzTmwfS1C8nt1gvduUHtdp8XF58hn1OqGrd2IqzENaX
         Yclf3Q35PhPmAepRWgNtOJ8QlH28JuqtNzhnPG+BFoXrNBXlXXTpYqUU8FWw9k/CTDrP
         VlPNzcf8iyaZM0ioeZCO2L5RYxgRasjNnsBe+0Wz7AsotIT13u3rBFlAK5tkly9Q3xC9
         S3UA==
X-Forwarded-Encrypted: i=1; AL+hErGyCz+/kD4j1ShPQbygCtSPZbGWKX4rYHdI8GxAkIs8HWweQp9jmkAER07RKLVNNHWeJx//VGdN0rTTAJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z96HcYYYEjMAawbR2GQM7vQ1rsrVx1wtJ+quDJ/F9ziuptihg0d
	2wMBI6nSOBLkPoebVClM4xI380UO8KIrwV9AmmSUsQRtT/faH6yREe/t
X-Gm-Gg: AZFdTZca9/YM3nP03EpdTRUbOW7l57e4EFycgxfL4a2JW34i5tYj3wjDiOUFza2uxRB
	5JOMnr+CG7JD2w72Zj0L905UTHYE+d3CeEtnEBY4ElcOPze7MS6+IeRi6o0yJtQm3izqVIr9nIs
	8lIGMa29M0Rr2vcbKCEtvk6loe5ISNYOUVuiDMLFr4CXW8GWQ1ZGPysBRoZXZb02OAhTwwJYYNp
	4e5e/HNJWBiFZN24b4+zk6z1prBW9ajCTFDH3EMuBTqaecRHPR0MNfxawPy3aMXBi5Oq+Uj8fnX
	TB1c0yAXowbSA7jHYhnrzb08wACn7KCSCdm1rK70M7CZyopTl2gt1k2EaeeXe0Y5b+AIWQY1GZG
	PDcpq1PjdkcG5OMB/tpoa2kr07tmrIfY7ZZTCDc0qP/48YiLPuBLdaGmsa/tzhulWmc7LMedg13
	HObkOD35vSFB5kF8SReVewhIbRBLOjD/XvP/QQ/5KMYU69nptZ91SmbdbC4I2y0werZ1VOd8U7O
	0kPfCgZONSeEBpKwl0JH2UQsQOZ1h7/Mzif6el9q5KrBRZPYfphMZVKIZbUp461Zk46GXue9TEA
	4uhiU+WjMTYK1s1ZrAJhZ5uC3IJ/h4bOzS0=
X-Received: by 2002:a05:690c:6886:b0:8b3:1fab:fbdc with SMTP id 00721157ae682-8b52051799emr42051537b3.64.1795437404195;
        Mon, 23 Nov 2026 04:36:44 -0800 (PST)
Received: from localhost ([2600:1700:4a51:2210::11])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df330d552sm5305608d50.5.2026.11.23.04.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:36:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 07:36:41 -0500
Message-Id: <DN2LFVSRGDPE.U9JFJ59G1RX8@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <willemb@google.com>
Subject: Re: [PATCH net-next v5 4/6] psp: defer tx key deletions for SADB
 drivers
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261118-psp-v5-4-b9ec840e0296@gmail.com>
 <179530218277.3135.14647055020229146998@kernel.org>
In-Reply-To: <179530218277.3135.14647055020229146998@kernel.org>

On Sat Nov 21, 2026 at 6:03 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] With the -EOPNOTSUPP guard gone from psp_sock_tx_rekey()
>   (net/psp/psp_sock.c), any unprivileged owner of an established PSP TCP=
=E2=80=A6
> - [Low] The applied commit message does not say that this patch turns on
>   Tx rekey for SADB devices.
> - [Low] The kernel-doc for psp_dev_ops::tx_key_add and ::tx_key_del in
>   include/net/psp/types.h still says only that each callback 'Can be=E2=
=80=A6
>
> --
>
> psp: defer tx key deletions for SADB drivers
>
> This patch adds a deferred Tx key deletion queue for PSP devices that
> store Tx keys in an SADB. Before calling psp_dev_tx_key_del(), the core
> snapshots BQL queued byte counts per Tx queue and polls until those bytes
> have completed. It also removes the -EOPNOTSUPP restriction on Tx rekey
> for SADB devices and makes CONFIG_INET_PSP depend on CONFIG_BQL.
>
>> diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
>> index ba44154cf8dc0..789315dae2373 100644
>> --- a/net/psp/psp_main.c
>> +++ b/net/psp/psp_main.c
>
> [ ... ]
>
>> @@ -75,7 +77,8 @@ psp_dev_create(struct net_device *netdev,
>>  		    !psd_ops->rx_spi_alloc ||
>>  		    !psd_ops->get_stats ||
>>  		    (!psd_ops->tx_key_add !=3D !psd_ops->tx_key_del) ||
>> -		    (psd_caps->assoc_drv_spc && !psd_ops->tx_key_add)))
>> +		    (psd_caps->assoc_drv_spc && !psd_ops->tx_key_add) ||
>> +		    (psd_ops->tx_key_add && !netdev_need_ops_lock(netdev))))
>>  		return ERR_PTR(-EINVAL);
>
> [Severity: Low]
> Should the kernel-doc for tx_key_add and tx_key_del in
> include/net/psp/types.h be updated along with this check? It still only
> says:
>
> 	 * @tx_key_add: add a Tx key to the device
> 	 * Install an association in the device. Core will allocate space
> 	 * for the driver to use at drv_data.
> 	 * Can be left NULL if device does not store Tx keys and @tx_key_del
> 	 * is also NULL.
>
> With this patch, a driver that implements these callbacks needs an ops
> locked netdev. Without one, psp_dev_create() hits the WARN_ON and returns
> -EINVAL.
>
> The driver also needs exact, in-order BQL accounting and has to follow
> the dql_reset() and real_num_tx_queues rules that psp_deferred_del_work()
> relies on.
>
> These rules are only written down in Documentation/networking/psp.rst,
> and the ops kernel-doc doesn't point there. A driver written from the
> struct documentation alone could hit the registration WARN, stall the
> grace period, or end it too early.
>
> Could the kernel-doc reference the new "Deferred Tx key deletion"
> section? No later patch in the series appears to update it.
>
>> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
>> index d497f41c483e1..8de313805af03 100644
>> --- a/net/psp/psp_sock.c
>> +++ b/net/psp/psp_sock.c
>
> [ ... ]
>
>> @@ -287,10 +302,6 @@ psp_sock_tx_rekey(struct sock *sk, struct psp_dev *=
psd, struct psp_assoc *pas,
>>  	struct psp_assoc *new;
>>  	int err;
>> =20
>> -	if (psp_dev_has_sadb(psd)) {
>> -		NL_SET_ERR_MSG(extack, "Tx rekey not supported on this device");
>> -		return -EOPNOTSUPP;
>> -	}
>>  	if (!pas->peer_tx) {
>>  		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
>>  		return -EBUSY;
>
> [Severity: Low]
> This isn't a bug, but could the commit message say outright that Tx
> rekey is now allowed on SADB devices?
>
> The earlier commit "psp: support tx rekey operation" said SADB drivers
> would "return -EOPNOTSUPP for now". With this guard removed,
> PSP_CMD_TX_ASSOC on a socket that already has a Tx key now succeeds on
> mlx5, where it used to fail.
>
> The only explicit mention is "allow tx rekey on SADB devices" in the v2
> changelog below the --- line, and that part is dropped when the patch is
> applied.
>
> The same goes for the new registration requirement in psp_dev_create():
>
> 	(psd_ops->tx_key_add && !netdev_need_ops_lock(netdev))
>
> The body only says drivers "must meet the requirements in
> Documentation/networking/psp.rst".
>
>> @@ -322,6 +333,7 @@ psp_sock_tx_rekey(struct sock *sk, struct psp_dev *p=
sd, struct psp_assoc *pas,
>>  	list_move(&pas->assocs_list, &psd->stale_assocs);
>> =20
>>  	rcu_assign_pointer(sk->psp_assoc, new);
>> +	pas->flags |=3D PSP_ASSOC_DEFER_TX_KEY_DEL;
>>  	psp_assoc_put(pas);
>> =20
>>  	return 0;
>
> [Severity: Medium]
> Can an unprivileged user use up the device's hardware Tx key pool
> through this path?
>
> PSP_CMD_TX_ASSOC has no GENL_ADMIN_PERM. psp_sock_assoc_set_tx() enters
> psp_sock_tx_rekey() whenever pas->tx.spi is already set, and each call
> allocates a new hardware key:
>
> psp_sock_tx_rekey()
>   psp_assoc_set_tx()
>     psp_dev_tx_key_add()
>       mlx5e_psp_assoc_add()
>         mlx5_create_encryption_key()
>
> The old key then goes onto the deferred deletion queue, which has no
> upper bound:
>
> net/psp/psp_deferred_del.c:psp_deferred_del_queue() {
> 	list_move_tail(&pas->assocs_list, &psd->tx_del.next);
> 	schedule_delayed_work(&psd->tx_del.work, 0);
> }
>
> psp_deferred_del_work() handles one grace period at a time and polls
> every PSP_TX_GRACE_POLL_MS (1000 ms). Keys queued during a grace period
> wait for the next one. A single socket can therefore pin as many DEKs as
> it can rekey in that window, where before each socket held at most one.
>
> Suppose a queue below real_num_tx_queues never completes the bytes
> snapshotted in psp_tx_grace_start(). Would every later rekey then pin a
> DEK, a psp_assoc and a psd reference until psp_dev_unregister()?
>
> When a grace period does end, psp_deferred_del_work() calls
> psp_dev_tx_key_del() for the whole batch while holding psd->lock. On mlx5
> each call is a firmware command:
>
> 	list_for_each_entry(pas, &to_free, assocs_list)
> 		psp_dev_tx_key_del(psd, pas);
>
> Would that block other PSP netlink operations, and psp_assoc_free() for
> every socket on the device, until the batch is done?
>
> The psp_assoc allocation uses GFP_KERNEL_ACCOUNT, but the hardware DEK
> pool is shared by the whole device and is not charged to any cgroup. One
> local user could make tx_key_add fail for other users' sockets. That
> includes sockets in other netns that were delegated the same device.
>
> The commit message acknowledges this ("users should avoid presenting PSP
> devices to users they don't trust to abuse this"). In the main netns,
> though, every local user can reach the device. Nothing later in the
> series appears to change these paths.
>
> Is a cap on the deferred queue length, or a per-socket rate limit,
> needed before SADB rekey is allowed?

As discussed on every prior posting of this series, in the commit
message, and cover letter, the rate limiting is left for future work.
The psp dev should be hidden from a user that can't be trusted to do
this.
