Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795092057;
	b=0tEzZEqVGRj24KmziE/a9odvZww3o26BHEWXAs/+1ndRhY9VBzm5sO4I9VF0d8jNjudh
	 lh3c9pR4HkwBjdbsVhLZ+hc4JrROJb+iigdNfl+YUQh0RNt3OH82JcW8cgpHuR+gKtr6X
	 6qiFiy5NQ8AM6CI94+WnFkRU1+hO6u+BgRVl8NpmYnUhS3y7/lgAFKlBYt6KT973RbZ5A
	 sO6AZWR3c44LU2SZvqJ4xGYPqCMJ9q2ofgJUpdg/sg57pUMQoxdagqrmuizz8Q7YfDl01
	 I4uW9b5/+9kbMAhEndTqgzuYEAHpVuFd8Zm2HJdZNH2KakSMCnlNXqs0vKmr0pyQ/VQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092057;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zTOX7fNQMIQV/FS/5aztvoNYi95Dx4FBvaRi9P53wnY=;
	b=DbErydlyFwJLBb5vvHljXDhwTb13rGYrxWyv9Il3vwzZH0CWM1WlRkbXJkQZBaN6gNJE
	 MfTqOSTOD1x/Bk6qfur3EO3wojRJ8JPHKUGPP4ZicJ7z/NUqpkIv9DusobAqhTwvS81aN
	 WfSt0Xojz5DMqJH5c0gf8NLI3mM6spx9xBcXFs5V4LfQPPuXdc98eaBVr0DHrFeqkLMG8
	 vwiQm4FIV/dPPADpV2315zAfBZe25zM7fCCbaGmEyPkWT42sg2nKMGh6FsqkDXwyFLt/X
	 +rvrkyBdFWtoIq2fwPLLrOZkEz0cDow7bJMcEeGrQYy7aEuPloqmrp2W561gjttSlLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JZ8gWZ8k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.39
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013039.outbound.protection.outlook.com [40.93.201.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01BF606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C01BF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JZ8gWZ8k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LauXrM1hugYkULyxG5cCE/xAFkNqmuQd4DxyRmWka6Fd1SFbYgR5QfsqOtRECtnhU1aK8SVIPAcxCjQtDaDAHfaudFLrGLi7Hz/u/C6G5JT5e/GeT3F+6bR8oLpidvweINwVMfZfvQ9C2njGNRxa8LSHdiv6cbeTqUOLtTigaUUyPSq9meD3n0qFwivZqxirdP+b+agYhNExKnpPDfmF97OQP19li5YCpZPu/Nd1PiXo2IDvvperPnNAVW0vl14HJdPJ+5mLTHk31p47Dz+kJg61f4fRrVreyAHJnYrWyz++Zr0IsHc82LMUJXTEUGRrgN+96rJqgZU4RdNpOmt8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTOX7fNQMIQV/FS/5aztvoNYi95Dx4FBvaRi9P53wnY=;
 b=GvE2w6eRV1g/LAViSqUgTtZDdXHHPq8cJfVsJaZ3EDIJAvTxDnuSZfgi+CRSZmxkGWzqGZeLCjZxQl1qMbuTYlxIn9Kik5g3axWciKMIYZMs9d7Fn7UTgCzdsrZABGcGTwA3uYD1VBVZNqyaNhS+FlAv4sW86sObrWDsweVP2977kObjo30zP/iSIxSvu3x4mFwZZ0Xm402wckODlqJEV49BGGiAtz7EAxWvBJkGX6NFCUphjJBZn9KErSDAjyT0eYprtt5Kg9oLpuJtPn8QuFmRS8lPVzfAwcE7L8XQDitG4zG2QI6oM/tvowkQEC2jGOXMZ+Xa/7XLPR6dYTInLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTOX7fNQMIQV/FS/5aztvoNYi95Dx4FBvaRi9P53wnY=;
 b=JZ8gWZ8kObDOgsbc7rOJODD5WdAmHO1zZSid7MNI8vxrAUOwIdt/mTL/lbI7do38buJO5lgh7evwM7Rc1C5mXrJDnT5f9v9dYC41AlX4weuehLj1WrLwA3kzn8IfnVcaeGdEgIzWNjQFSdHe7OXgBid3dCvP5L5jLDtThfISeVM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7771.namprd12.prod.outlook.com (2603:10b6:8:138::6) by
 PH0PR12MB8798.namprd12.prod.outlook.com (2603:10b6:510:28d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 12:36:50 +0000
Received: from DS0PR12MB7771.namprd12.prod.outlook.com
 ([fe80::9a3e:791f:33b6:3d8c]) by DS0PR12MB7771.namprd12.prod.outlook.com
 ([fe80::9a3e:791f:33b6:3d8c%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 12:36:50 +0000
Message-ID: <4e8e1f1a-f68e-4fe6-87b1-6198603eee87@amd.com>
Date: Thu, 19 Nov 2026 13:36:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] mm/memory: remove unused
 vmf_insert_mixed_mkwrite()
To: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 "Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
 "Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Lorenzo Stoakes <ljs@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
 <179501440852.7660.18348444744304711431.b4-ty@b4>
Content-Language: en-US
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <179501440852.7660.18348444744304711431.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::8) To DS0PR12MB7771.namprd12.prod.outlook.com
 (2603:10b6:8:138::6)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7771:EE_|PH0PR12MB8798:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7398bf-d39f-4b08-ac32-08df4639c860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|261022075727099003|10067099003|261021121427099003|56012099006|4143699003|11063799006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uMad/yuLJNPRMeFpl8Sy8B66Cmfe+sXRS3I9x3qKen5Mn7HqGtaPs4PoidT8g36MJH96iDKSXEj/PlN632TzHR/aZybHhmuhlM3wqJJoNvyYeqyzrrqU7GP/CFSpTcYCK3VuG64NGUilmg+HWCwzfQHUZgvBIIzvbfDoJIjRt0OW0mYTFx1mMoigX5RCo1kXK/6gtSZ/jNkW8le5J4EgspVa4wP+ChxYTWSIK7BgrDekmz24+R/Wj1TLtrsSO5J8GkDKC3tPOVv9fJ0r1lFcUrPDl+VLkz2NwDMafK/V3+qNiUaAYIekRvgKIhJsci/IWvmdunRN0qLIrTddh8rAWinIrZp52bCjNAm/W2yCNJzLhh3x3lxEOBkHOgPWJMPfve9dtgoPEpMkl21M8cTSjGFRrOQv9fcHau5Kc//7cmhMf9L0ncWLp1a9X7IB6zWKhnLkYox9hPnbsAgZPd29omeo6sxwYV6TxrIqT+fV7zs64XlBgOz3ZseQ6nsxyP1JCwTbQY4HbZHukkVBAY9kyxdl1ZLsqNwpWHHEK45j4PLVbA98FPl5jsVaEsJ6CGmq07tv7qQK1MdJ7YZDgrxRl8fVRTD3LRPiAWHwYRL/zJk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7771.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(261022075727099003)(10067099003)(261021121427099003)(56012099006)(4143699003)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTJlb0s1K0ZkOExGMWpFc0RQTGpzNkgvMXBCQXBjQllYR1JPbWsvdTY2ckZV?=
 =?utf-8?B?YmQ5NGJWcWhkZ29IN3pqdHRhbmFhVXk4YmdCSG8ySWlxUVROcXNLUVFyQnlI?=
 =?utf-8?B?YW5BSEJGKzFBUjFwNFFHSWdMZ1lRWVJ5U1IrNDFUb2ttWEZsSk1PWXNpVkNk?=
 =?utf-8?B?b3hIRVFCaXE1Mkl1ZkVEV2doWktuR1ExdjBWNElESVp6bEZlbVlpRUR1SFhv?=
 =?utf-8?B?azN1eWZVOU8rUExvdUhMQ2RJZlVFb0xDbHdCdmxTd05uVExoMlYxVEpzY0FL?=
 =?utf-8?B?N0tERXFsMUpBWGhFRFh6aXlKTEV1SkUyVDRod3hEUEFWWGlieWpGV3pwWk5w?=
 =?utf-8?B?V1R6czdtQmRzNmhBUVp6WEJHMzlkMnY3aUxKMFp3Qk5MWFE3RDJvTU1DSHFB?=
 =?utf-8?B?OWtTbFVWYnM1WFJYdGlGTnhrNHRQeEJwV0VzMkdXT2ZBM2FmUkNZUTlPTGRx?=
 =?utf-8?B?dHhob3ZUay9zTGRxWW9lQkp0dXFyLzluMkI4bm1Jb2tDRFRzRUJjbFFoaUtS?=
 =?utf-8?B?S3JjQmhrY0JHdHJkeSsxajBVS1lSemMwWGR3dWRVKzRDU1pqc29LanB4NmRx?=
 =?utf-8?B?K1N3eVBjL1R3cXlCSEpMRmJYRGdVYkhaR1NMM3NCZVpTeXAyR0dkbVNQeU1i?=
 =?utf-8?B?WGdrdGhNSFFpeCtVci9Ta0U0NEtmRHR5QUVTRGtQdGJodE1RODE5TGtOMFJu?=
 =?utf-8?B?aXl3dGRXNkFlZWxDbWtFbERFc2d4VWFrYm81MlRRWGFLbXZqaXVXckUzVUIw?=
 =?utf-8?B?bXlGZXZCaHlrVEN4dlppNHQ2TGNyS1dhM0E1dTJQekFHQWY1MG5WODdHQXQ1?=
 =?utf-8?B?TUlhaGJzME1DekFaNEZJUUs5ZzVxc01CQzJoQWJJTXJZYlY2YjZhSjltejNu?=
 =?utf-8?B?Z1p1YzJIbFBUcWhrODJWTldCb2NodU90REc4V2xXZThWT3BkdGlDVjNvNHpD?=
 =?utf-8?B?MHNTKzhvUmdlc0t6bkR4V1laQmN6Z1plKzZ3Z1hyNlhOdzcrWXN0ZVpvYXpS?=
 =?utf-8?B?WVdqRi9UYUlsK0tUeCtNY2dMQVVmRndwVE9SRlltcFcrdy9SNlgzVlJYNkFx?=
 =?utf-8?B?ZmQwTCtPLzJRS2t0N1gvWHBCSDhTUEdLSWo5WklFUEwxKzNQSDlwTXlSOUVD?=
 =?utf-8?B?UTRmakh6RS9Ka3EzMXJ5UE1zRkg3ZnZ6ZlFqTGMxQ0RkYWxhelliSGZObEoy?=
 =?utf-8?B?djVSeXJWbGJpK0diZ0xNazVTdEQzZk1NRTk4YnUrd21tT2ZPTjBuejdXRHRo?=
 =?utf-8?B?ZGp1TkNPa1p4dm8zZEsrVFlvQVhpeE55K1pnR045S0tPTGdzQjdJWGlQdjFQ?=
 =?utf-8?B?UmtRdTRwWnZLeDNkdEpYV3BoODdSNDFjM0FpWDNTMzVJcDlpZG82NE9KUDdB?=
 =?utf-8?B?MTZDSzhwaVJzYWZyVHZrK2pscFV4eTY3QzVTMkVxSk1HNnIwVjgxczZpcktt?=
 =?utf-8?B?YkJkRStTN2JCNm5hRDZMZyt6YkNFb1A1MTNOMkZMWmdQUld3VEEyaTlVYmNQ?=
 =?utf-8?B?UTY1TlpmNFNXR1llQzUvK1lLeXl4TjFDVHJTcXpUQTJDL1JtMWk1NEQ2Zkl2?=
 =?utf-8?B?OEtDRVYwVHI0bXZhOWoyR1cwR1FvdmFmeXZUaFV4OHlWbWg3Q0pablRtZVlo?=
 =?utf-8?B?MVNjT2ZQdngxTzdzTEg2T0w2RVR0bGFhV1VXTmQ0TkFWQnNzQU45VHMxY0lq?=
 =?utf-8?B?N0FqdTlBQ1lBMjY1end6czYzRzR3TGZ2SThBWnZWNDk2ckhMQ21PL2xJYnNG?=
 =?utf-8?B?eitlcDd1cnNPdHUzS2NaRVdiWmRXdGpMRVQwd3dtTjRLQnRVOFR4RFhFWENI?=
 =?utf-8?B?YkhBOFhrUnJUcE5zZGh3cVRGekRuQ3B0U1hpbGtJK1ZVdE45LzFnZGt5bEJG?=
 =?utf-8?B?K2M5NmI0Z2Q0TXlZQ2dpYkc5c2RVUEFjS1BLb09acnhTSmtLRFBjY3cwUWhx?=
 =?utf-8?B?bVZYSWJuVmozRWhaUjNrM290bmNSdjNBQWdpTVNUNjBPeEtGOFhtcTRCZ2hX?=
 =?utf-8?B?K21sQTdyKzBzbi9GanF2LzRaZk81ai9yRVdNNCtEaXdrM0tJZGJnZFp5Sjd1?=
 =?utf-8?B?dE5nWWQraTFVT0R4STAyZytoSEhpYjNmeEl5c3d3QU5lS2FCdUdzbUd0SFgy?=
 =?utf-8?B?ZVpuZzFYSXpUVzNuK04xcnoxOHdwczdtRHY2WlBDYkZRbENTOVRYZC9QM2ZH?=
 =?utf-8?B?UVdKdzIzdnRMaVRWQXZXREVoSnQ5MjVPNmxLU0lQK3FJSVVlb2xheE0vVUJ0?=
 =?utf-8?B?bkp3OUoyVjM1UmdTNmYxampSZ3Z0VWU0TVZOcEVRS2NWQm9xUWxDbGZPbzdR?=
 =?utf-8?Q?UXs4lfbKlAeVVjMXqr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7398bf-d39f-4b08-ac32-08df4639c860
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7771.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:36:50.1627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPMBSC502QwWAR4Fx0sGlgAzx4KHT0DvxzgOUzefT86qD9uJaVDMTH8vpSo4fKga9TTWh3wd8ndxb5zjDdA+bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8798


On 11/18/2026 4:06 PM, David Hildenbrand wrote:
> On Sat, 03 Oct 2026 01:05:31 +0900, Sang-Heon Jeon wrote:
>> Since commit 38607c62b34b ("fs/dax: properly refcount fs dax pages"),
>> vmf_insert_mixed_mkwrite() has no callers. This series removes it and
>> the mkwrite handling that only it used.
>>
>> Patch 1 removes the function.
>>
>> Patch 2 removes the mkwrite argument, which is then always false. It
>> also removes the unreachable code in insert_pfn().
>>
>> [...]
> Applied, thanks!
>
> tree: mm/core.git
> branch: core-7.5.misc
>
> Applied patches will appear soon in mm-next, followed by linux-next.
>
> Please report any outstanding bugs that were missed during review, so we
> can either drop the patch series or decide how to fix it up.
>
> It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
> though the patches have already been applied. If possible, patch trailers
> will be updated.
>
> Note that commit hashes shown below are subject to change due to rebase,
> trailer updates or similar. Further, this is not a guarantee that the
> patches will go upstream. If in doubt, please check the listed branch.
>
> [1/3] mm/memory: remove unused vmf_insert_mixed_mkwrite()
>        https://git.kernel.org/mm/core/c/fedea7ae
> [2/3] mm/memory: remove the mkwrite argument from __vm_insert_mixed()
>        https://git.kernel.org/mm/core/c/a3405fa5
> [3/3] mm/memory: merge __vm_insert_mixed() into vmf_insert_mixed()
>        https://git.kernel.org/mm/core/c/ac2fd084

The patches are already applied.  But in case it still helps:

For the series:

Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>



